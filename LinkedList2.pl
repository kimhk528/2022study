package Node;

use strict;
use warnings;

sub new
{
    my $class = shift;
    my $self = {};
    $self->{value} = shift;
    $self->{next}  = undef;
    bless $self , $class;
    return $self ;
}

package LinkedList;

sub new{

    my $class = shift;
    my $self = {};
    $self->{head} = undef;
    $self->{tail} = undef;
    $self->{idx} = 0;
    bless $self , $class;
    return $self ;
}

sub append {
    my ( $self, $value ) = @_ ;
    my $apnode = Node->new($value);
 
    if ( $self->{idx} == 0 ) {
        $self->{head} = $apnode;
        $self->{tail} = $apnode;
    }
    elsif ( $self->{idx} == 1 ){
        $self->{head}->{next} = $apnode;
        $self->{tail} = $apnode;
    }
    else{
        $self->{tail}->{next} = $apnode;
        $self->{tail} = $apnode;
    }
    $self->{idx} += 1;

}

sub printlist{
    my $self = shift;
    my $tnode = $self->{head};
    my $i=0;
    while ($i< $self->{idx}){
        print ($tnode->{value},"\n");
        $tnode = $tnode->{next};
        $i++;
    }
}

sub search{
    my ($self, $value) = @_;
    my $tnode = $self->{head};
    for (my $ii=1; $ii<=$self->{idx} ;$ii++){
        if ($tnode->{value} eq $value ){
            return $ii;
        }
        $tnode = $tnode->{next};
    }
    return -1
}

sub delete{
    my ($self, $idx) = @_;
    my $tnode = $self->{head};
    my $bnode = $self->{head};

    if ($idx == 1) {
        $self->{head} =$tnode->{next};
    }
    else {
        for (my $i=1 ; $i <$idx ; $i++){
            $bnode=$tnode;
            $tnode=$tnode->{next};
        }
        $bnode->{next}=$tnode->{next};
    }
    
    if($idx == $self->{idx}){
        $self->{tail}=$bnode;
    }
    
    $self->{idx} -=1;
    if ($self->{idx}==0){
        $self->{head} = undef;
        $self->{tail} = undef;
    }
}

sub insert{
    my ($self,$idx,$value) = @_;
    my $insnode = Node->new($value);
    my $tmpnode = $self->{head};
    if ($idx==1){
        $insnode->{next}=$self->{head};
        $self->{head}=$insnode;
        if( $self->{idx} == 0){
            $self->{tail}=$insnode;
        }
    }
    elsif($idx > $self->{idx}){
        $self->{tail}->{next}=$insnode
    }
    else {
        for( my $i=1 ; $i < $idx; $i++){
            $tmpnode = $tmpnode->{next};
        }
        $insnode->{next} = $tmpnode->{next};
        $tmpnode->{next}=$insnode;
    }
    $self->{idx} +=1;
}

sub select {
    my($self,$idx) = @_;
    my $tmpnode= $self->{head};
    for ( my $i=1; $i < $idx; $i++){
        $tmpnode=$tmpnode->{next};
    }
    return $tmpnode->{value}
}

sub update{
    my ($self,$idx,$value) = @_;
    my $tmpnode=$self->{head};
    for ( my $i=1; $i<$idx; $i++){
        $tmpnode = $tmpnode->{next};
    }
    $tmpnode->{value} = $value;

}

my $jlist = new LinkedList();

=xx
$jlist->insert(1,"aa");
$jlist->printlist();
=cut

#=comments
$jlist->append("kim");
$jlist->append("hyung");
$jlist->append("keun");
$jlist->append("!!!");
#$jlist->delete(5);
#$jlist->delete(3);
#$jlist->delete(2);
#$jlist->delete(1);
$jlist->update(5,"zz");
print ("tail:",$jlist->{tail}->{value},"|head:",$jlist->{head}->{value},"\n");
$jlist->printlist();

my $aa = $jlist->select(3);
print $aa;
 $aa = $jlist->select(2);
print $aa;
 $aa = $jlist->select(1);
print $aa;
