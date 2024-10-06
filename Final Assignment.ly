\version "2.24.3"

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
    bes a f g f e 
    d4. r
  }
  \repeat volta 2 {
    g'16 a bes c d8 bes g d 
    f16 g a bes c8 a f c 
    e16 f g a bes8 g e bes
    d16 e f g a8 f d f
    g bes a g f e 
    d4. cis
    a8. bes16 a8 d g, f 
    bes8. c16 bes8 g16 a bes c d8 
    a8. bes16 a8 g f e 
    gis a b cis b a 
    bes a f g f e 
    f4. r
    a8. bes16 a8 e' cis a 
    d a f e d e 
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
    bes8 g d g16 a bes c d8 
    a f c f16 g a bes c8 
    g e bes e16 f g a bes8 
    f d a d16 e f g a8
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
     <d e gis>4. <cis e a> 
     <a d f>4. <a cis e g> 
     <d f a>2.
  }
  \repeat volta 2 {
     bes8 <d g> bes <d g> bes <d g>
     a <c f> a <c f> a <c f>
     g <bes e> g <bes e> g <bes e>
     f <a d> f <a d> f <a d>
     e4. <g bes>
     <a d f>4. <a cis e>
     <d f a>4. r 
     <d g bes> r 
     <d f a> r 
     <d e gis>4. <cis e a> 
     <a d f>4. <a cis e g> 
     <bes d f>2.
     <d f a>4. <cis e a> 
     <a d f> <a cis e g> 
     <d, a' d>2.
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
          \repeat volta 2 { i "iv64" i "V42/V" "V6" "i64" "V7" i }
          \repeat volta 2 { "iv6" _ _ _ _ _ "iii6" _ _ _ _ _ 
                            "iio6" _ _ _ _ _ "i6" _ _ _ _ _ "iio" _ "i64" V i "iv64" i "V42/V" "V6" "i64" "V7" vi i "V6" "i64" "V7" i }
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
