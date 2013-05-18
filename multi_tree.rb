class Node
	attr_accessor :value, :parent, :children

	def initialize(value)
		@value = value
		@children = []
	end

	def add_child(node)
		node.parent = self
		@children.push(node)
	end

	def dfs(target)
		if self.value == target
			self
		elsif self.children == []
			nil
		else
			self.children.each do |child|
				a = child.dfs(target)
				next if a == nil
				return a if a.value == target
			end
			nil
		end
	end

	def bfs(target)
		queue = [self]

		until queue.empty?
			checking_node = queue.shift
			if checking_node.value == target
				return checking_node
			else
				checking_node.children.each do |child|
					queue.push(child)
				end
			end
		end
	end


end

a = Node.new(1)
b = Node.new(2)
c = Node.new(3)

a.add_child(b)
a.add_child(c)

p a.dfs(0)
