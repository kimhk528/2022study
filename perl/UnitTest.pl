use Test::More "no_plan" ;

use LinkedList;

$jlist = new LinkedList::LinkedList();
$jlist->append("kim");
$jlist->append("hyung");
$jlist->append("keun");
$jlist->append("!!!");
$jlist->printlist($jlist->{head});
$jlist->search($jlist->{head},"!!!",0);
