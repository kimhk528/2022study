import unittest
import LinkedList

class PyTests(unittest.TestCase) :

    def setUp(self) -> None:
        print (" 파이선 연결리스트 숙제검사 시작")
        return super().setUp()


    def tearDown(self) -> None:
        print (" 파이선 연결리스트 숙제검사 종료")
        return super().tearDown()

    def test_append(self) :
        l=LinkedList.LinkedList()
        l.append("kim")
        l.append("hyung")
        l.append("keun")
        l.append("!!!")
        l.printlist(l.head,0)
        
    def test_search(self) :
        l=LinkedList.LinkedList()
        l.append("kim")
        l.append("hyung")
        l.append("keun")
        l.append("!!!")        
        aa=l.search(l.head,"keun",0)
        self.assertEqual(aa, 3)        
    
    def test_delete(self) :
        l=LinkedList.LinkedList()
        l.append("kim")
        l.append("hyung")
        l.append("keun")
        l.append("!!!")        
        l.delete(l.head,4)
        l.printlist(l.head,0)    

if __name__ == '__main__':
    unittest.main()

