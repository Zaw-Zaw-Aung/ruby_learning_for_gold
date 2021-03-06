def add_method(c,m,&b) #method name m,class c,body b
    c.class_eval {
        define_method(m, &b)
    }
end
puts add_method(String, :greet) {"Hello," + self } #greet
puts "world".greet #Hello world
#############################################Define a singleton method
def add_class_method(c,m,&b)
    eigenclass = class << c; self; end
    eigenclass.class_eval {
        define_method(m, &b)
    }
end
puts add_class_method(String, :greet) { |name| "Hello," + name }
puts String.greet("world")
### More easy way to define singleton method
String.define_singleton_method(:greet) {|name| "Hello," + name }
puts String.greet("world")
#To create a synonym or an alias for an existing methods, can use this
puts "alias plus +"
# alias_method is a private method  of module.As a method its can accept two arbitary exceptions as its arguemtns,
#rather than requiring two identifier to be hradcoded in source code.
#"alias_method can sometimes used alias changing existing methods"
def backup(c, m, prefix = "original") #method m ,in the class (or module) c
    n = :"#{prefix}_#{m}" #compute the alias
    c.class_eval { #alias method is private
        alias_method n,m #make n alias for m
    }
end
puts backup(String, :reverse)
puts "test".original_reverse
"remove_method and undef_method are private method of Module"
"remove_method removes the definition of the methods from the current class"
"undef_method is more serve: it prevent any invocation of of the specified method through the specified class"