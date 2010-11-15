class Lexer

  def self.lex(source)
    lexer = RubyLexer.new('fileforlexing', source)
    result = ""
    until RubyLexer::EoiToken===(token=lexer.get1token)

      if token.is_a? RubyLexer::VarNameToken
        if CONSTANTS::RUBY_CLASSES.include?(token.ident) || CONSTANTS::RAILS_CLASSES.include?(token.ident)
          result << token.ident
        else
          if token.ident[0,1] == '@'
            result << 'INST_VAR'
          elsif token.ident[0,1].upcase == token.ident[0,1]
            result << 'CONST'
          else
            result << 'VAR'
          end
        end

      elsif token.is_a? RubyLexer::MethNameToken
        if CONSTANTS::RUBY_METHODS.include?(token.ident) || CONSTANTS::RAILS_METHODS.include?(token.ident)
          result << token.ident
        else
          result << 'METHOD'
        end

      elsif token.is_a? RubyLexer::StringToken
        result << 'STRING'

      elsif token.is_a? RubyLexer::SymbolToken
        result << 'SYMBOL'

      elsif token.is_a? RubyLexer::NumberToken
        result << 'NUMBER'

      elsif token.is_a? RubyLexer::WsToken
        result << ' '

      elsif token.is_a? RubyLexer::EscNlToken
        result << "\n"

      elsif token.is_a? RubyLexer::IgnoreToken
      elsif token.is_a? RubyLexer::FileAndLineToken

      else
        result << token.to_s #+ "\t" + token.class.name
      end
    end

    result
  end

end
