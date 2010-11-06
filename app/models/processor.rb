class Processor < ::Ruby2Ruby

  def initialize
    @lvar_substitutes = {}
    @lvar_substitute_counter = 0

    @defn_substitutes = {}
    @defn_substitute_counter = 0

    @ivar_substitutes = {}
    @ivar_substitute_counter = 0

    super
  end

  def process_lasgn(exp)
    exp[0] = substitute_lvar(exp[0])
    super
  end

  def process_iasgn(exp)
    exp[0] = substitute_ivar(exp[0])
    super
  end

  def process_lvar(exp)
    exp[0] = substitute_lvar(exp[0])
    super
  end

  def process_ivar(exp)
    exp[0] = substitute_ivar(exp[0])
    super
  end


  def process_defn(exp)
    exp[0] = substitute_defn(exp[0])
    super
  end

  def process_lit(exp)
    klass= exp[0].class
    exp[0]= klass.name
    super
  end

  def process_str(exp)
    exp[0]= "String"
    super
  end

  def process_call(exp)
    super
  end

  private

  def substitute_lvar(name)
    if @lvar_substitutes[name].nil?
      @lvar_substitute_counter += 1
      @lvar_substitutes[name] = "var_#{@lvar_substitute_counter}"
    end
    @lvar_substitutes[name]
  end

  def substitute_defn(name)
    if @defn_substitutes[name].nil?
      @defn_substitute_counter += 1
      @defn_substitutes[name] = "fn_#{@defn_substitute_counter}"
    end
    @defn_substitutes[name]
  end

  def substitute_ivar(name)
    if @ivar_substitutes[name].nil?
      @ivar_substitute_counter += 1
      @ivar_substitutes[name] = "@ivar_#{@ivar_substitute_counter}"
    end
    @ivar_substitutes[name]
  end
end
