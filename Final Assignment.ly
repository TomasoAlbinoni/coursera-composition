\version "2.20.0"

\header {
  title = "Composition Final Assignment"
  composer = "Thomas van Nellen"
}

melody = \relative c'' {
  \clef treble
  \key d \minor
  \tempo "Moderato"
  \time 6/8

  \repeat volta 2 { 
    a8. bes16 a8 d g, f
    bes8. c16 bes8 g16 a bes c d8 
    a8. bes16 a8 g f e 
    gis a b cis b a 
    d a f e8. d16 e8 
    d4. r
  }
  \repeat volta 2 {
    d'8 cis d g16 a bes c d8 
    c, bes c f16 g a bes c8 
    bes, a bes e16 f g a bes8 
    a, g a d16 e f g a8 
    g bes a g f e 
    d4. cis
    a8. bes16 a8 d g, f 
    bes8. c16 bes8 g16 a bes c d8 
    a8. bes16 a8 g f e 
    gis a b cis b a 
    f8. g16 f8 e8. d16 e8 
    f4. r
    a8. bes16 a8 e' cis a 
    d a f e8. d16 e8 
    d2.
  }
  \bar "|."
}

upper = \relative c' {
  \clef treble
  \key d \minor
  \tempo "Moderato"
  \time 6/8
  \repeat volta 2 {
    d'8 a f r d f 
    d' bes g r d g 
    a f d r a d 
    b' gis e r cis e 
    f8 d a g' e cis 
    d f a d4.
  }
  \repeat volta 2 {
    bes8 g d d'16 c bes a g8 
    a f c c'16 bes a g f8 
    g e bes bes'16 a g f e8 
    f d a a'16 g f e d8
    g e bes e g bes 
    d f d e4.    
    d8 a f r d f 
    d' bes g r d g 
    a f d r a d 
    b' gis e r cis e 
    f8 d a g' e cis 
    d f a d4.
    d8 a f r8 a, cis 
    f d a g' e cis 
    d f a d4.
  }
}

lower = \relative c {
  \clef bass
  \key d \minor
  \tempo "Moderato"
  \time 6/8
  \repeat volta 2 {
     <d f a>4. r 
     <d g bes> r 
     <d f a> r 
     <b d gis>4. <cis e a> 
     <a d f>4. <a cis e g> 
     <d f a>2.
  }
  \repeat volta 2 {
     <bes' d g>4. r 
     <a c f> r 
     <g bes e> r 
     <f a d> r 
     <e g bes> r 
     <d f a>4. <a cis e>
     <d f a>4. r 
     <d g bes> r 
     <d f a> r 
     <b d gis>4. <cis e a> 
     <a d f>4. <a cis e g> 
     <bes d f>2.
     <d f a>4. <cis e a> 
     <a d f> <a cis e g> 
     <d f a>2.
  }
}

\score {
  <<
    \new Staff \with {
      midiInstrument = "violin"
      instrumentName = "Violin"
    }
    {
      \autoBeamOff \melody
    }
    \new PianoStaff \with {
      instrumentName = "Piano"
    }
    <<
      \new Staff = "upper" \upper
      \new Staff = "lower" \new Voice = "lower" \lower
      \new Lyrics {
        \lyricsto "lower" {
          \repeat volta 2 { i iv i "V7/V" "V6" "i64" "V7" i }
          \repeat volta 2 { "iv6" "iii6" "iio6" "i6" "iio" "i6" V i iv i "V7/V" "V6" "i64" "V7" vi i "V6" "i64" "V7" i }
        }
      }
    >>
  >>
  \layout {
    \context { \Staff \RemoveEmptyStaves }
  }
  \midi {
    \tempo 4=80
  }
}
