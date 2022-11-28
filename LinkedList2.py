class Node:
    def __init__(self, value):
        self.value=value
        self.next=None

class LinkedList:
    def __init__(self):       
        self.head=None
        self.tail=None
        self.idx=0

    def append(self,value):
        apnode=Node(value)
        if self.idx==0 :
            self.head=apnode
            self.tail=apnode
        elif self.idx==1 :
            self.head.next=apnode
            self.tail=apnode
        else :     
            self.tail.next=apnode
            self.tail=apnode
        self.idx += 1

    def printlist(self):        
        tnode=self.head
        for i in range(self.idx) :
            print(tnode.value)
            tnode=tnode.next
        
        print ("list count =>",self.idx)               

    def search(self,value) :
        tmpnode = self.head
        for i in range(self.idx):
            if tmpnode.value ==  value :
                return i+1
            else:
                tmpnode=tmpnode.next
        return False

    def delete(self,idx) :
        bfnode=self.head
        tnode=self.head

        if idx == 1 :
            self.head=self.head.next         
        else :
            for i in range(1,idx):
                bfnode=tnode
                tnode=tnode.next  
            bfnode.next=tnode.next
        
        if(idx==self.idx):
            self.tail=bfnode     

        self.idx -= 1
        if self.idx == 0:
            self.head=None
            self.tail=None

    
    def insert(self,idx,value) :
        insnode = Node(value)      
        if idx==1 :
            insnode.next=self.head
            self.head=insnode
            if self.idx ==0 :
                self.tail = insnode
        elif idx > self.idx :
            self.tail.next=insnode
            self.tail=insnode
        else :  
            bnode=self.head   
            for i in range (2,idx):
                bnode=bnode.next
            
            insnode.next=bnode.next
            bnode.next=insnode            
        self.idx += 1        

    def select(self,idx) :       
        bnode=self.head   
        for i in range (1,idx):
            bnode=bnode.next
        return bnode.value   

    def update(self,idx,value) :
        bnode=self.head   
        for i in range (1,idx):
            bnode=bnode.next
        bnode.value=value





    
