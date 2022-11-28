class Node{
    constructor(value){
        this.value=value;
        this.next=null;
    }
}

class LinkedList{
    constructor(){
        this.head=null,
        this.tail=null,
        this.idx=0
    }

    append(value) {
        const apnode=new Node(value);
        if(this.idx===0){
            this.head=apnode;
            this.tail=apnode;
        }
        else if ( this.idx===1){
            this.head.next=apnode;
            this.tail=apnode;
        }
        else{           
            this.tail.next=apnode;
            this.tail=apnode;
        }
        this.idx++;
    }

    printlist(){
        let tnode=this.head;
        for ( var i=0;i<this.idx;i++){
            console.log(tnode.value);
            tnode=tnode.next;
        }
    }

    search(value){
        let tmpnode=this.head;
        for (var i=0 ; i < this.idx ; i++){
            if(tmpnode.value==value){
                return i+1;
            }
            else{
                tmpnode=tmpnode.next;
            }
        }
        return false;
    }

    delete(idx){
        let bnode=this.head;
        let tnode=this.head;
        if(idx===1){
            this.head=this.head.next;
        }
        else{
            for(var i=1;i<idx;i++){
                bnode=tnode;
                tnode=tnode.next;
            }
            bnode.next=tnode.next;
        }
        if(idx===this.idx){
            this.tail=bnode;
        }
        this.idx--;
        if (this.idx==0){
            this.head=null;
            this.tail=null;
        }

    }

    insert(idx,value){
        const insnode=new Node(value);
        let tmpnode=this.head;

        if (idx==1){
            insnode.next=this.head;
            this.head=insnode;
            if (this.idx==0){
                this.tail=insnode;
            }
        }
        else if(idx>this.idx){
            this.tail.next=insnode;
            this.tail=insnode;
        }
        else{
            for( var i=2; i<this.idx;i++){
                tmpnode=tmpnode.next;
            }
            insnode.next=tmpnode.next;
            tmpnode.next=insnode;           
        }
        this.idx++;
    }

    select(idx){
        let tmpnode=this.head;
        for( var i=1;i<idx;i++){
            tmpnode=tmpnode.next;            
        }
        return tmpnode.value;
    }

    update(idx,value){
        let tmpnode=this.head;
        for(var i=1;i<idx;i++){
            tmpnode=tmpnode.next;
        }
        tmpnode.value=value;
    }



}
const l=new LinkedList();
l.append("kim");
l.append("hyung");
l.append("keun");
l.append("!!!");
//l.delete(4);
//l.delete(3);
//l.delete(2);
//console.log(l);
l.insert(5,"aa");
l.update(5,"aaa");
l.printlist();
console.log(l);
console.log(l.select(5));
console.log(l.search("!!"));
