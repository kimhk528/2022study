package contact;

use strict;
use warnings;

sub new
{
    my $class = shift;
    my $self = {};
    $self->{cid} = shift;
    $self->{name}  = shift;
    $self->{phone} = shift;
    $self->{email} = shift;
    $self->{birth} = shift;
    $self->{address}= shift;
    $self->{zip} = shift;
    $self->{memo} = shift;
    $self->{gid} =shift;
    bless $self , $class;
    return $self ;
}

package addressbook;

sub new{

    my $class = shift;
    my $self = {};
    $self->{@address} = ();
    $self->{cnt} =0;
    $self->{cid} =0;
    
    bless $self , $class;
    return $self ;
}

sub addCont{
    my ($self,$name,$phone,$email,$birth,$address,$zip,$memo,$gid) = @_;
    my $idx=$self->{cnt};
    $self->{cid} +=1;
    my $tmpcont=contact->new($self->{cid},$name,$phone,$email,$birth,$address,$zip,$memo,$gid) ;
    for ( my $i=0; $i <$self->{cnt};$i++){
        if ($self->{address}->[$i]->{name} > $tmpcont->{name}){
            $idx=$i;
            $i=$self->{cnt};#break
        }
    }
    $self->setCont($idx,$tmpcont);

}

sub setCont {
    my ( $self, $idx, $tmpcont ) = @_ ;
    for ( my $i=$self->{cnt}; $i<$idx; $i--){
        $self->{address}->[$i+1] = $self->{address}->[$i];
    }
    $self->{cnt} += 1;
}


my $aa = new addressbook();
$aa->addCont('kim','010','a@a.com','19991231','addressinfo','12345','','');
print ($aa->{$address[0]},"\n");
print ($aa->{cnt},"\n");
print ($aa->{cid},"\n");



