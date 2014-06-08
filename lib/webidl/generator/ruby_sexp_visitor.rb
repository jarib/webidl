module WebIDL
  class RubySexpVisitor

    def visit_module(mod)
      [:block,
        [:module, classify(mod.name),
          [:scope,
            [:block] + mod.definitions.map { |d| d.accept(self) }
          ]
        ]
      ]
    end

    def visit_interface(intf)
      [:module, classify(intf.name),
        ([:scope, [:block] + intf.inherits.map { |inherit| [:call, nil, :include, [:arglist, inherit.accept(self)]] }] unless intf.inherits.empty?),
        [:scope,
          [:block] + intf.members.map { |m| m.accept(self) }
        ]
      ].compact
    end

    def visit_dictionary(dict)
      [:module, classify(dict.name),
        ([:scope, [:block] + dict.inherits.map { |inherit| [:call, nil, :include, [:arglist, inherit.accept(self)]] }] unless dict.inherits.empty?),
        [:scope,
          [:block] + dict.members.map { |m| m.accept(self) }
        ]
      ].compact
    end

    def visit_exception(ex)
      [:class, classify(ex.name), [:const, :StandardError],
        [:scope,
          [:block] + ex.members.map { |m| m.accept(self)}
        ]
      ]
    end

    def visit_const(const)
      [:cdecl, const.name, [:lit, const.value]] # FIXME: won't always be literals - need Literal AST node?
    end

    def visit_enum(enum)
      [:cdecl, enum.name, [:lit, enum.values]]
    end

    def visit_field(field)
      [:call, nil, :attr_accessor, [:arglist, [:lit, field.name.to_sym]]]
    end

    def visit_attribute(attribute)
      func = attribute.readonly? ? :attr_reader : :attr_accessor
      [:call, nil, func, [:arglist, [:lit, attrify(attribute.name).to_sym]]]
    end

    def visit_dictionary_member(mem)
      [:call, nil, :attr_accessor, [:arglist, [:lit, attrify(mem.name).to_sym]]]
    end

    def visit_callback(callback)
      arguments = callback.arguments.map { |a| [:lit, attrify(a.name).to_sym] }

      [:defn, callback.name,
        [:args] + callback.arguments.map { |a| a.accept(self) },
        [:scope,
          [:block,
            [:call, nil, :raise,
              [:arglist,
                [:const, :NotImplementedError]
              ]
            ]
          ]
        ]
      ]
    end

    def visit_operation(operation)
      if operation.name.empty?
        if operation.setter?
          meth = :[]=
        elsif operation.getter?
          meth = :[]
        elsif operation.creator?
          meth = :initialize
        elsif operation.stringifier?
          meth = :to_s
        elsif operation.deleter?
          meth = :delete!
        elsif operation.legacycaller?
          meth = operation.parent.name
        else
          raise "no name for operation #{operation.inspect}"
        end
      else
        meth = attrify(operation.name)
        meth << "=" if operation.setter?
      end

      [:defn, meth.to_sym,
        [:args] + operation.args.map { |a| a.accept(self) },
        [:scope,
          [:block,
            [:call, nil, :raise,
              [:arglist,
                [:const, :NotImplementedError]
              ]
            ]
          ]
        ]
      ]
    end

    def visit_argument(argument)
      name = attrify(argument.name)
      arg = argument.variadic? ? "*#{name}" : name

      arg.to_sym
    end

    def visit_type_def(typedef)
      # don't care
    end

    def visit_implements_statement(impls)
      [:module, classify(impls.implementor),
        [:scope,
          [:call, nil, :include,
            [:arglist,
              [:const, classify(impls.implementee)]
            ]
          ]
        ]
      ]
    end

    def visit_scoped_name(sn)
      [:const, classify(sn.qualified_name)]
    end

    private

    def classify(string)
      s = string.to_s

      if s.include?("::")
        s.split("::").map { |e| classify(e) unless e.empty? }.compact.join("::").to_sym
      else
        "#{s.slice(0,1).upcase}#{s[1..-1]}".to_sym
      end
    end

    RESERVED = %w[
      BEGIN	do	next	then
      END	else	nil	true
      alias	elsif	not	undef
      and	end	or	unless
      begin	ensure	redo	until
      break	false	rescue	when
      case	for	retry	while
      class	if	return	while
      def	in	self	__FILE__
      defined?	module	super	__LINE__
    ]

    def attrify(string)
      attr = string.snake_case
      attr += '_' if RESERVED.include?(attr)

      attr
    end

  end # RubySexpVisitor
end # WebIDL
