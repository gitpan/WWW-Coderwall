package WWW::Coderwall;

# ABSTRACT: Simple Perl interface to the coderwall API

use WWW::Coderwall::User;
use Moo;



sub get_user {
    my ( $self, $username ) = @_;
    
    return WWW::Coderwall::User->new_from_username($username); 
}

1;

__END__
=pod

=head1 NAME

WWW::Coderwall - Simple Perl interface to the coderwall API

=head1 VERSION

version 0.001

=head1 SYNOPSIS

    use WWW::Coderwall;

    $cw = WWW::Coderwall->new;

    $user = $cw->get_user($username);

    print $user->location;

=head1 METHODS

=head2 get_user

Returns a WWW::Coderwall::User object given a username.

=head1 AUTHOR

Robert Picard <mail@robert.io>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2012 by Robert Picard.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

