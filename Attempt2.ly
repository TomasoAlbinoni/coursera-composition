\version "2.24.3"

\header {
  title = "Composition Final Assignment"
  composer = "Thomas van Nellen"
}

melody = \relative c'' {
  \clef treble
  \key c \major
  \tempo "Allegro"
  \time 3/4

  \repeat volta 2 { 
    c4 c,8 d e f g4 c g d' b g c^\markup "IAC" c, r d' g,8 a b c d4 b g c g e g2^\markup "HC"  r4
    c4 c,8 d e f g4 c g d' b g c^\markup "IAC" c, r d' g,8 a b c d4 b g d'8 c b a g b c2^\markup "IAC" r4
  }
  \repeat volta 2 {
    c4. e8 d c b4. d8 c b a4. c8 b a g f g4 r f'4. a8 g f e4. g8 f e d4. f8 e d c2^\markup "IAC" r4
    c4 c,8 d e f g4 c g d' b g c^\markup "IAC" c, r d' g,8 a b c d4 b g d'8 c b a g b c2^\markup "DC"  r4
    b4. c8 d e fis,4 g8 a b4 c4 g8 a b4 c2.^\markup "PAC" 
  }
}

upper = \relative c' {
  \clef treble
  \key c \major
  \tempo "Allegro"
  \time 3/4
  \repeat volta 2 {
    c2 e4 c2 e4 b2 d4 e2 r4 d2 b4 d2 b4 e2 c4 g'2 r4
    c,2 e4 c2 e4 b2 d4 e2 r4 d2 b4 d2 b4 f'2 b,4 g'2 r4
  }
  \repeat volta 2 {
     a8 g a2 g8 f g2 f8 e f2 e8 d e2 d'8 c d2 c8 b c2 b8 a b2 c2 r4
     c,2 e4 c2 e4 b2 d4 e2 r4 d2 b4 d2 b4 f'2 b,4 e2 r4
     g2 f4 a2 b4 e,2 d4 <c e>2.
  }
}

lower = \relative c {
  \clef bass
  \key c \major
  \tempo "Allegro"
  \time 3/4
  \repeat volta 2 {
     <c e g>2 r4 <c e g>2 r4 <b d g>2 r4 <c e g>2 r4 <b d g>2 r4 <b d g>2 r4 <c e g>2 r4 <b d g>2 r4
     <c e g>2 r4 <c e g>2 r4 <b d g>2 r4 <c e g>2 r4 <b d g>2 r4 <b d g>2 r4 <b d g>2 r4 <c e g>2 r4
  }
  \repeat volta 2 {
     c4 e a b, d g a, c f g, b e f a d e, g c d, f b <e, g c>2 r4
     <c e g>2 r4 <c e g>2 r4 <b d g>2 r4 <c e g>2 r4
     <b d g>2 r4 <b d g>2 r4 <g b d>2 r4 <a c e>2 r4
     <g b d>2 <b d f>4 <d fis a>2 <b d g>4 <g c e>2 <g b d>4 <c g'>2.
     
  }
}

\score {
  <<
    \new Staff \with {
      instrumentName = "Violin"
    }
    {
      \melody
    }
    \new PianoStaff \with {
      instrumentName = "Piano"
    }
    <<
      \new Staff = "upper" \upper
      \new Staff = "lower" \new Voice = "lower" \lower
      \new Lyrics {
        \lyricsto "lower" {
          \repeat volta 2 {
            I I "V6" I "V6" "V6" I "V6" I I "V6" I "V6" "V6" "V65" I
          }
          \repeat volta 2 {
            "vi6" _ _ "V6" _ _ "IV6" _ _ "iii6" _ _ "ii6" _ _ "I6" _ _ "viio6" _ _ "I6"
            I I "V6" I "V6" "V6" "V7" vi V viio "V/V" "V6" "I64" V I
           }
        }
      }
    >>
  >>
  \layout {
    \context { \Staff \RemoveEmptyStaves }
  }
}

\score {
  \unfoldRepeats {
    <<
      \new Staff \with {
        midiInstrument = "violin"
      }
      {
        \melody
      }
      \new PianoStaff \with {
        midiInstrument = "piano"
      }
      <<
        \new Staff = "upper" \upper
        \new Staff = "lower" \new Voice = "lower" \lower
      >>
    >>
  }
  \midi {
    \tempo 4=140
  }
}
