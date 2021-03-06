package PDL::Radio;

use common::sense;

our $VERSION = '0.001';

require Exporter;
our @ISA = qw(Exporter);
our @EXPORT = qw(PI);

sub PI () { 3.14159265358979 }


use PDL::Radio::Player;



our $DEFAULT_PLAYER;

sub default_player {
  $DEFAULT_PLAYER ||= PDL::Radio::Player->new;
  return $DEFAULT_PLAYER;
}


#use PDL::Graphics::PGPLOT; dev('/XSERVE'); line($osc);
#use PDL::Graphics::Gnuplot; gplot($osc, { terminal => 'x11' }); sleep 100000;


1;



__END__


=encoding utf-8

=head1 NAME

PDL::Radio - Amateur radio system built on PDL

=head1 SYNOPSIS

    use PDL::Radio::All;


    ## Basic sounds for testing:

    ## Play 500 Hz sine wave for 5 seconds:
    PDL::Radio::Sine->new(freq => 500)->play(5);

    ## Play 1 second of a sine wave, phase shift 180 degrees, play another second:
    PDL::Radio::Sine->new->play(1)->play(1,PI);

    ## Plot .01 second of a sawtooth wave:
    plot(PDL::Radio::Sawtooth->new->get(.01));


    ## CW (morse code):

    ## Call CQ:
    PDL::Radio::CW->new->play("CQ CQ CQ DE VE3HOY VE3HOY " x 10);

    ## Change keying envelope (hard/min/hanning):
    PDL::Radio::CW->new(shape => 'hard')->play("CQ CQ CQ");

    ## Risetime in milliseconds:
    PDL::Radio::CW->new(shape => 'hanning', risetime => 10)->play("CQ CQ CQ");


    ## RTTY:

    ## Call CQ:
    PDL::Radio::RTTY->new->play("CQ CQ CQ DE VE3HOY VE3HOY " x 10);

    ## Custom baud/freq_shift:
    PDL::Radio::RTTY->new(freq_shift => 90, baud => 20)->play("CQ CQ CQ");


    ## PSK-31:

    ## Call CQ:
    PDL::Radio::PSK->new->play("cq cq cq de VE3HOY VE3HOY " x 10);

    ## Transmit all 0s (two tones):
    PDL::Radio::PSK->new->play("\x00"x100, 800);

    ## Transmit all 1s (single tone):
    PDL::Radio::PSK->new->play("\xFF"x100, 800);
    

=head1 DESCRIPTION

This is a work-in-progress library for generating modem data and playing it through L<Pulse Audio|http://www.freedesktop.org/wiki/Software/PulseAudio/>. Pulse Audio makes redirecting the audio output to programs like L<fldigi|http://www.w1hkj.com/Fldigi.html> really easy.

=head1 SEE ALSO

L<The PDL::Radio github repo|https://github.com/hoytech/PDL-Radio>

L<PDL::Audio> is similar to this module except that it interfaces to sndlib where this module interfaces to pulseaudio. L<PDL::Audio> is a pain to setup and I couldn't figure out how to send data to fldigi. Also, L<Pulse::Audio> doesn't seem to be on CPAN anymore?

=head1 AUTHOR

Doug Hoyte, C<< <doug@hcsw.org> >>

=head1 COPYRIGHT & LICENSE

Copyright 2012-2013 Doug Hoyte.

This module is licensed under the same terms as perl itself.

=cut
