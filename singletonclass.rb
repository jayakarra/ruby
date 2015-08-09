class SingletonClass
   def self.test
     self
   end

  class << self
    def test1
      "I am test"
    end
  end

   def test3
     self.singleton_class
   end

   def test4
     self.singleton_class
   end

   def self.test5
     self.singleton_class
   end

   def self.test6
     self.singleton_class
   end

end

x = SingletonClass.test

 p x.singleton_methods
 p x.instance_methods
 p SingletonClass.new.test3.object_id == SingletonClass.new.test4.object_id
 p SingletonClass.test5.object_id == SingletonClass.test6.object_id
