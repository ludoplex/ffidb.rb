# This is free and unencumbered software released into the public domain.

module FFIDB
  class Function < Struct.new(:name, :type, :file, :line, :comment, :parameters, keyword_init: true)
    include Comparable

    ##
    # @param [FFI::Clang::Cursor] declaration
    def self.parse_declaration(declaration)
      location = declaration.location
      comment = declaration.comment
      self.new(
        name: declaration.spelling,
        type: declaration.type.spelling,
        file: location&.file,
        line: location&.line,
        comment: comment&.text,
        parameters: [],
      )
    end

    ##
    # @return [Integer]
    def <=>(other) self.name <=> other.name end

    ##
    # @return [Boolean]
    def public?() self.name[0] != '_' end

    ##
    # @return [Boolean]
    def nonpublic?() !(self.public?) end

    ##
    # @return [Boolean]
    def nullary?() self.arity.zero? end

    ##
    # @return [Boolean]
    def unary?() self.arity.equal?(1) end

    ##
    # @return [Boolean]
    def binary?() self.arity.equal?(2) end

    ##
    # @return [Boolean]
    def ternary?() self.arity.equal?(3) end

    ##
    # @return [Integer]
    def arity() self.parameters.size end

    ##
    # @return [String]
    def return_type
      self.type.split('(', 2).first.strip
    end
  end # Function
end # FFIDB
