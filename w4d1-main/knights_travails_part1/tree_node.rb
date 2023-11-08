class PolyTreeNode

    attr_reader :value, :parent, :children
  
    def initialize(root)
        @value = root
        @parent = nil
        @children = []
    end

    def parent=(newParent)  
        if self.parent != nil
            self.parent.children.delete(self)
        end
        @parent = newParent
        newParent.children << self # if newParent != nil
    end
   
    def add_child(child)
        child.parent = self
        if !self.children.include?(child)
            self.children << child
        end
    end

    def remove_child(child)
        if child.parent == nil
            raise "Child has no parent"
        end
        child.parent = nil
    end

    def dfs(target = nil, &prc)
    raise "Need a proc or target" if [target, prc].none?
    prc ||= Proc.new { |node| node.value == target }

    return self if prc.call(self)

    children.each do |child|
      result = child.dfs(&prc)
      return result unless result.nil?
    end

    nil
    end

  def bfs(target = nil, &prc)
    raise "Need a proc or target" if [target, prc].none?
    prc ||= Proc.new { |node| node.value == target }

    nodes = [self]
    until nodes.empty?
      node = nodes.shift

      return node if prc.call(node)
      nodes.concat(node.children)
    end

    nil
  end


end
