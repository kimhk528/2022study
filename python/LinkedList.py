class Node:
    def __init__(self, value):
        self.value=value
        self.next=None

class LinkedList:
    def __init__(self):       
        self.head=None
        self.tail=None

    def append(self,value):
        apnode=Node(value)
        if self.head == None :
            self.head=apnode
        else :
            if self.head.next == None :
                self.head.next=apnode
                self.tail=apnode
            else :     
                self.tail.next=apnode
                self.tail=apnode

    def printlist(self,node,cnt):        
        print(node.value)
        cnt += 1
        if node.next==None :
            print ("list count =>",cnt)               
        else:
            self.printlist(node.next,cnt)

    def search(self,node,value,idx) :
        idx += 1
        if node.value == value :
            return idx

        if node.next == None:
            return -1              
        
        result=self.search( node.next, value, idx)
        return result

    def delete(self,node,idx) :
        if idx == 1 :
            self.head=self.head.next         
        else :
            bfnode=node
            tnode=node
            
            for i in range(1,idx):
                bfnode=tnode
                tnode=tnode.next

            bfnode.next=tnode.next
            print(bfnode,bfnode.next,i)
 
    
