import datetime
now = (datetime.datetime.now()).strftime('%Y%m%d%H%M%S%f')
print ("now111",now)
#연락처ID,이름,전화번호,이메일,생일,주소,우편번호,메모,그룹ID
class contact:
    def __init__(self,cid,name,phone,email,birth,address,zip,memo,gid):
        self.cid=cid
        self.name=name
        self.phone=phone
        self.email=email
        self.birth=birth
        self.address=address
        self.zip=zip
        self.memo=memo
        self.gid=gid   

#그룹id,그룹이름,사용여부,그룹메모
class group:
    def __init__(self,gname,gmemo):
        self.gid=now
        self.gname=gname
        self.useyn='Y'
        self.gmemo=gmemo

#연락처id,순위
class bookmark:
    def __init__(self,cid,rank):
        self.cid=cid
        self.rank=rank

#연락처ID,수정일시,이름,전화번호,이메일,생일,주소,우편번호,메모,그룹id
class contacthistory:
    def __init__(self,cid,name,phone,email,birth,address,zip,memo,gid):
        self.cid=cid
        self.update=now
        self.name=name
        self.phone=phone
        self.email=email
        self.birth=birth
        self.address=address
        self.zip=zip
        self.memo=memo
        self.gid=gid 


class addressbook:
    def __init__(self):
        self.address=[]
        self.cnt=0
        self.cid=0

    def addCont(self,name,phone,email,birth,address,zip,memo,gid):        
        idx=self.cnt
        self.cid=self.cid+1
        tmpcont=contact(self.cid,name,phone,email,birth,address,zip,memo,gid)
        for i in range(self.cnt):
            if self.address[i].name > tmpcont.name:
                idx=i
                break
        self.setCont(idx,tmpcont)

    def setCont(self,idx,tmpcont) :
        print (idx,tmpcont.name)
        self.address.__sizeof__
        for i in range (self.cnt,idx,-1) :
     #       self.address[i+1]=self.address[i]
            print(i)
        self.address.insert(idx,tmpcont)
        self.cnt = self.cnt+1;
        print(self.cnt, self.address)
     #   self.address[idx]=tmpcont   

    def selCont(self,idx):
        print ( "[",idx,"]",self.address[idx].cid,self.address[idx].name,self.address[idx].phone,self.address[idx].email,self.address[idx].birth,self.address[idx].address,self.address[idx].zip,self.address[idx].memo,self.address[idx].gid)
        return self.address[idx]

    def allCont(self) :
        for i in range(self.cnt) :
            self.selCont(i)
    
    def delCont(self,idx) :
        self.address[idx]=None
        for i in range(idx,self.cnt-1):
            print(i)
            self.address[i]=self.address[i+1]
        self.cnt = self.cnt-1
        self.address[self.cnt]=None
    
    def srchCont(self,cid):
        for i in range(self.cnt):
            if (self.address[i].cid==cid):
                return i
        return False

    def upCont(self,cid,name,phone,email,birth,address,zip,memo,gid):
        tmpcont=contact(cid,name,phone,email,birth,address,zip,memo,gid)
        idx = self.srchCont(cid)
        self.delCont(idx)
        self.setCont(idx,tmpcont)

        
aa=addressbook()
aa.addCont('kim','010','a@a.com','19991231','addressinfo','12345','','')
aa.addCont('zim','010','a@a.com','19991231','addressinfo','12345','','')
aa.addCont('yim','010','a@a.com','19991231','addressinfo','12345','','')
aa.selCont(0)
aa.selCont(1)
aa.selCont(2)
aa.delCont(0)
aa.upCont('3','yim','12','a@a.com','19991231','addressinfo김민재골','12345','','')
aa.allCont()
aa.selCont(2)


