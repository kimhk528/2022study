"use strict";

class jNode{
    value: any;
    next: undefined;
    constructor(value:undefined){
        this.value=value;
        this.next=undefined;
    }
}

class LinkedList{
    head:any;
    tail:any;
    idx:number;
    constructor(){
        this.head=undefined,
        this.tail=undefined,
        this.idx=0
    }

    append(value:any) {
        const apnode=new jNode(value);
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
        this.idx=this.idx+1;
    }

    printlist(){
        let tnode=this.head;
        for ( var i=0;i<this.idx;i++){
            console.log(tnode.value);
            tnode=tnode.next;
        }
    }

    search(value:any){
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

    delete(idx:number){
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

    insert(idx:number,value:any){
        const insnode=new jNode(value);
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

    select(idx:number){
        let tmpnode=this.head;
        for( var i=1;i<idx;i++){
            tmpnode=tmpnode.next;            
        }
        return tmpnode.value;
    }

    update(idx:number,value:any){
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