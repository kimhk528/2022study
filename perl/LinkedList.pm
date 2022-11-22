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
    bless $self , $class;
    return $self ;
}

sub append {
    my ( $self, $value ) = @_ ;
    my $apnode = Node->new($value);
 
    if ( defined $self->{tail}) {
        if (defined $self->{head}->{next}){
            $self->{tail}->{next} = $apnode;
        }
        else {
            $self->{head}->{next} = $apnode;
        }
        $self->{tail} = $apnode;   
    }
    else{
        $self->{head} = $apnode;
        $self->{tail} = $apnode;           
    }
    print $self->{head}."\n";
    print $self->{tail}."\n";
    
    print $self->{head}->{value}."\n";
    print $self->{head}->{tail}."\n" if (defined $self->{head}->{tail});
    print $self->{tail}->{value}."\n";
}

sub printlist{
    my ($self, $cnode) = @_;
    print $cnode->{value}."\n";
    if ( $cnode ne $self->{tail}){
        $self->printlist($cnode->{next});
    }
}

sub search{
    my ($self, $cnode, $value, $idx) = @_;
    if ($cnode->{value} eq $value) {
        print "[$value] search result => index[$idx]";        
    }
    else{
        $self->search($cnode->{next},$value,$idx+1);
    }

}

1;