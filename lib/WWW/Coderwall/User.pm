package WWW::Coderwall::User;

use LWP::Simple;
use JSON;

use Moo;


has username => (
    is => 'ro',
);


has name => (
    is => 'ro',
);


has location => (
    is => 'ro',
);


has endorsements => (
    is => 'ro',
);


has team => (
    is => 'ro',
);


has accounts => (
    is => 'ro',
);


has badges => (
    is => 'ro',
);


sub new_from_username {
    my ( $self, $username ) = @_;

    my $uri = "http://coderwall.com/$username.json";

    my $raw_json = get($uri);

    my $json = JSON->new->allow_nonref;

    my %user_data = %{$json->pretty->decode( $raw_json )};

    return __PACKAGE__->new(
        username    => $user_data{'username'}, 
        name        => $user_data{'name'},
        location    => $user_data{'location'},
        team        => $user_data{'team'},
        accounts    => $user_data{'accounts'},
        badges      => $user_data{'badges'},
        endorsements    => $user_data{'endorsements'},
    );
}

1;

__END__
=pod

=head1 NAME

WWW::Coderwall::User

=head1 VERSION

version 0.001

=head1 ATTRIBUTES

=head2 username

coderwall username

=head2 name

Full name

=head2 location

The location set in the user's coderwall profile

=head2 endorsements

The number of endorsements the user has received

=head2 team

The team that the user belongs to.

=head2 accounts

A hash of accounts that the user has added in their profile

=head2 badges

An array of badges that the user has earned

=head1 METHODS

=head2 new_from_username

Returns a new WWW::Coderwall::User object created with information from
a call to the API with a given username.

=head1 AUTHOR

Robert Picard <mail@robert.io>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2012 by Robert Picard.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

