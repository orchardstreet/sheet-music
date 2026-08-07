\version "2.22.1"

\header {
  title = "Lasta"
  composer = "William Lupinacci"
}

% --- NEW: Layout and Page Formatting ---
\paper {
  top-margin = 15\mm
  bottom-margin = 15\mm
  left-margin = 15\mm
  right-margin = 15\mm
  score-system-spacing.basic-distance = #12
  system-system-spacing.basic-distance = #18
}

rightHand = {
  \clef treble
  \time 4/4
  
  % --- UNLOCK FULL MIDI DYNAMIC RANGE ---
  \set Score.midiMinimumVolume = #0.2
  \set Score.midiMaximumVolume = #1.0
  
  % --- SECTION 1: CREEPY ---
  \set Staff.instrumentName = #"Muted Trumpet"
  \set Staff.shortInstrumentName = #"Mut.Trp."
  
  % Bar 1-3: Muted Trumpet right from the start! Cap at 70% (Boosted 20%)
  \set Staff.midiInstrument = #"muted trumpet"
  \set Staff.midiMaximumVolume = #0.7
  \set Staff.midiMinimumVolume = #0.0
  
  \tempo "Creepy" 4 = 114 
  
  % Bar 1: Swell from \mp to \mf just for this bar
  gis'4\mp\<\staccato\marcato^\markup { \box \bold "Muted Trumpet" } g'2 e'4\mf |
  
  % Bar 2: Drop back to \mp and do a second, separate swell
  a'4\mp\<\staccato\marcato a4( c'4 ees'4\mf) |
  
  % Bar 3: Sudden drop back to \mp on the hold
  g'1\fermata\mp | 
  
  \break % --- FORCED LINE BREAK 1 ---
  
  % --- SECTION 1B: TRUMPET + DX7 SWEEP (BAR 4) ---
  \time 5/4
  \ottava #1
  
  % Mute comes OUT! Switch back to Open Trumpet, capped at 70%
  \set Staff.midiInstrument = #"trumpet"
  \set Staff.midiMaximumVolume = #0.7
  \set Staff.midiMinimumVolume = #0.0
  
  <<
    {
      f''8\ppp\staccatissimo\marcato^\markup { \box \bold "Open Trumpet 1 + DX7" } f'8\tenuto\marcato g''8\staccatissimo\marcato 
      bes'16\tenuto( c''16\staccato) e''16\tenuto( f''16\staccato) 
      des''16\tenuto( d''16\staccato) f''16\tenuto( e''16\staccato) 
      
      \tag #'print {
        g''16\tenuto(^\markup { \bold \italic "poco a poco rit." } c''16\staccato) 
        bes'16\tenuto( g'16\staccato) r8 |
      }
      \tag #'midi {
        \tempo 4 = 85 g''16\tenuto(
        \tempo 4 = 70 c''16\staccato) 
        \tempo 4 = 55 bes'16\tenuto(
        \tempo 4 = 40 g'16\staccato)
        \tempo 4 = 100 r8 |
      }
    }
    \tag #'midi {
      \new Staff {
        \set Staff.midiInstrument = #"electric piano 2"
        % MAGIC: Cap hidden DX7 volume to 70%
        \set Staff.midiMaximumVolume = #0.7
        \set Staff.midiMinimumVolume = #0.0
        
        f''8\ppp\staccatissimo\marcato f'8\tenuto\marcato g''8\staccatissimo\marcato 
        bes'16\tenuto( c''16\staccato) e''16\tenuto( f''16\staccato) 
        des''16\tenuto( d''16\staccato) f''16\tenuto( e''16\staccato) 
        g''16\tenuto( c''16\staccato) bes'16\tenuto( g'16\staccato) r8 |
      }
    }
  >>
  
  \ottava #0
  \break % --- FORCED LINE BREAK 2 ---
  
  % --- SECTION 2: FUNKY ---
  \time 4/4
  \set Staff.shortInstrumentName = #"Rho."
  \set Staff.midiInstrument = #"electric piano 1"
  
  \set Staff.midiMaximumVolume = #1.0
  \set Staff.midiMinimumVolume = #0.2
  
  \tempo "Funky" 4 = 140
  f'4\ff^\markup { \box \bold "Rhodes" }~ <bes~ f'>4 <bes~ g'~>4 <bes f' g'>4~ | 
  << { <bes f' g'>1 } { s2.\< s4\! } >> | 

  \repeat volta 2 {
    % Removed \staccato from the d'4 so it slurs smoothly!
    a'4.\ff\staccato g'4.\staccato d'4( |
    g'1) |
    g'4.\staccato f'4\staccato d'8\staccato c'8\tenuto( g'8\staccato) |
    f'1 |
  }
}

% --- DEDICATED CLAVINET STAFF ---
clavinetPart = {
  \clef treble
  \set Staff.instrumentName = #"Clavinet"
  \set Staff.shortInstrumentName = #"Clav."
  
  \time 4/4
  R1*3 |
  
  \time 5/4
  R4*5 |
  
  \time 4/4
  
  % Clavinet enters here and mirrors the Bass (transposed down one octave!)
  \set Staff.midiInstrument = #"clavinet"
  % RELAXED MUZZLE: Capped at 25% max volume in MIDI
  \set Staff.midiMaximumVolume = #0.25 
  \set Staff.midiMinimumVolume = #0.0
  
  << 
    { 
      s4. bes,4.\staccato bes,8\staccato bes,8\staccato 
    } 
    \\ 
    { g,1\ff^\markup { \box \bold "Clavinet" } } 
  >> | 

  g,4\staccato ges8\tenuto g8\staccato des8\tenuto d8\staccato bes,8\tenuto b,8\staccato |
  
  \repeat volta 2 {
    % Back to original octave for the main groove
    g8\pp\staccato d'8\staccato <f' bes'>8\staccato g8\staccato d'8\staccato <f' bes'>8\staccato d'8\staccato g8\staccato |
    
    g8\staccato g8\staccato bes8\staccato bes8\staccato c'8\staccato c'8\staccato des'8\tenuto( d'8\staccato) |
    
    bes8\staccato f'8\staccato <g' d''>8\staccato bes8\staccato f'8\staccato <g' d''>8\staccato f'8\staccato bes8\staccato |
    
    g8\tenuto( f8\staccato) d8\tenuto( des8\staccato) c8\tenuto( d8\staccato) bes8\tenuto( g8\staccato) |
  }
}

leftHand = {
  \clef treble 
  \time 4/4

  % --- SECTION 1: CREEPY ---
  \set Staff.instrumentName = #"Rhodes / Bass"
  \set Staff.shortInstrumentName = #"Rho."
  \set Staff.midiInstrument = #"electric piano 1"
  
  % Bar 1: Rhodes swells from \ppp to \p
  <c'~ e'~ gis'>4\ppp\<\sustainOn^\markup { \box \bold "Rhodes" } <c' e'~ g'~>4 <b e'~ g'>4 <bes e'>4\p\sustainOff |
  
  % Bar 2: Drop back to \ppp and do a second, separate swell
  a'4\ppp\<( a4)~ <a c'>4~ <a c' ees'>4\p~ |
  
  % Bar 3: Sudden drop back to \ppp on the hold
  <a c' ees' g'>1\fermata\ppp | 
  
  % --- SECTION 1B: DOUBLE TRUMPET SWEEP (BAR 4) ---
  \time 5/4
  \set Staff.midiInstrument = #"trumpet"
  
  \set Staff.midiMaximumVolume = #0.7
  \set Staff.midiMinimumVolume = #0.0
  
  <<
    {
      f'8\ppp\staccatissimo\marcato^\markup { \box \bold "Trump 2 + DX7" } f8\tenuto\marcato g'8\staccatissimo\marcato 
      bes16\tenuto( c'16\staccato) e'16\tenuto( f'16\staccato) 
      des'16\tenuto( d'16\staccato) f'16\tenuto( e'16\staccato) 
      
      \tag #'print {
        g'16\tenuto( c'16\staccato) bes16\tenuto( g16\staccato) r8 |
      }
      \tag #'midi {
        \tempo 4 = 85 g'16\tenuto(
        \tempo 4 = 70 c'16\staccato) 
        \tempo 4 = 55 bes16\tenuto(
        \tempo 4 = 40 g16\staccato)
        \tempo 4 = 100 r8 |
      }
    }
    \tag #'midi {
      \new Staff {
        \set Staff.midiInstrument = #"electric piano 2"
        \set Staff.midiMaximumVolume = #0.7
        \set Staff.midiMinimumVolume = #0.0
        
        f'8\ppp\staccatissimo\marcato f8\tenuto\marcato g'8\staccatissimo\marcato 
        bes16\tenuto( c'16\staccato) e'16\tenuto( f'16\staccato) 
        des'16\tenuto( d'16\staccato) f'16\tenuto( e'16\staccato) 
        g'16\tenuto( c'16\staccato) bes16\tenuto( g16\staccato) r8 |
      }
    }
  >>
  
  \clef bass

  % --- SECTION 2: FUNKY ---
  \time 4/4
  \set Staff.shortInstrumentName = #"Bass"
  
  \set Staff.midiMaximumVolume = #1.0
  \set Staff.midiMinimumVolume = #0.5
  
  << 
    { 
      \set Staff.midiInstrument = #"electric bass (finger)"
      s4. bes,4.\staccato bes,8\staccato bes,8\staccato 
    } 
    \\ 
    { g,1\fff_\markup { \box \bold "Electric Bass" } } 
  >> | 

  g,4\staccato ges8\tenuto g8\staccato des8\tenuto d8\staccato bes,8\tenuto b,8\staccato |
  
  \repeat volta 2 {
    \set Staff.midiInstrument = #"electric bass (finger)"
    
    bes,4\fff\staccato bes,8( g,4.) c8 d8\staccato |
    
    g,8\staccato g,8\staccato bes,8\staccato bes,8\staccato c8\staccato c8\staccato des8\tenuto( d8\staccato) |
    <<
      { r4 bes,8\fff bes,4 bes,4. } 
      \\ 
      { bes,,1\ff } 
    >> |
    
    g8\fff\tenuto( f8\staccato) d8\tenuto( des8\staccato) c8\tenuto( d8\staccato) bes,8\tenuto( g,8\staccato) |
  }
}

% --- SCORE 1: For the visual sheet music ---
\score {
  \keepWithTag #'print
  \new StaffGroup <<
    \new Staff = "right" \rightHand
    \new Staff = "clav" \clavinetPart
    \new Staff = "left" \leftHand
  >>
  \layout { 
    \context {
      \Staff
      \RemoveEmptyStaves
      \override VerticalAxisGroup.remove-first = ##t
    }
    \context {
      \Score
      \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/16)
      \override TimeSignature.break-visibility = #end-of-line-invisible
    }
  }
}

% --- SCORE 2: For the MIDI playback ---
\score {
  \keepWithTag #'midi
  \unfoldRepeats {
    \new StaffGroup <<
      \new Staff = "right" \rightHand
      \new Staff = "clav" \clavinetPart
      \new Staff = "left" \leftHand
    >>
  }
  \midi { 
    \context {
      \Score
      midiChannelMapping = #'instrument
    }
  }
}
