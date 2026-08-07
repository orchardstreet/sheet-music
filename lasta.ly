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
  \set Staff.instrumentName = #"Trumpet"
  \set Staff.shortInstrumentName = #"Trp."
  
  % Bar 1: Open Trumpet, NO volume tricks (100% ceiling)
  \set Staff.midiInstrument = #"trumpet"
  \set Staff.midiMaximumVolume = #1.0
  \set Staff.midiMinimumVolume = #0.2
  
  \tempo "Creepy" 4 = 90
  
  % Bar 1: Trumpet line now descends to the lower E (e')
  gis'4\mp\staccato\marcato^\markup { \box \bold "Open Trumpet" } g'2 e'4 |
  
  % Bar 2: Mute goes IN! Drop the ceiling to 50%
  \set Staff.midiInstrument = #"muted trumpet"
  \set Staff.midiMaximumVolume = #0.5
  \set Staff.midiMinimumVolume = #0.0
  
  a'4\mp\staccato\marcato^\markup { \box \bold "Muted Trumpet" } a4( c'4 ees'4) |
  
  % Bar 3
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
      des''16\tenuto( d''16\staccato) f''16\staccato e''16\staccato 
      
      \tag #'print {
        g''16\staccato^\markup { \bold \italic "poco a poco rit." } c''16\staccato 
        bes'16\staccato g'16\staccato r8 |
      }
      \tag #'midi {
        \tempo 4 = 85 g''16\staccato
        \tempo 4 = 70 c''16\staccato 
        \tempo 4 = 55 bes'16\staccato
        \tempo 4 = 40 g'16\staccato
        \tempo 4 = 90 r8 |
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
        des''16\tenuto( d''16\staccato) f''16\staccato e''16\staccato 
        g''16\staccato c''16\staccato bes'16\staccato g'16\staccato r8 |
      }
    }
  >>
  
  \ottava #0
  \break % --- FORCED LINE BREAK 2 ---
  
  % --- SECTION 2: FUNKY ---
  \time 4/4
  \set Staff.shortInstrumentName = #"Rho."
  \set Staff.midiInstrument = #"electric piano 1"
  
  % MAGIC: Restore Rhodes back to full 100% volume
  \set Staff.midiMaximumVolume = #1.0
  \set Staff.midiMinimumVolume = #0.2
  
  \tempo "Funky" 4 = 125 
  f'4\ff^\markup { \box \bold "Rhodes" }~ <bes~ f'>4 <bes~ g'~>4 <bes f' g'>4~ | 
  << { <bes f' g'>1 } { s2.\< s4\! } >> | 

  \repeat volta 2 {
    % Rhodes Melody
    a'4.\ff\staccato g'4.\staccato d'4\staccato |
    g'1 |
    % Applied tenuto slurred into staccato to the final two eighth notes!
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
  % Rest during the creepy intro (Staff will be hidden)
  R1*3 |
  
  \time 5/4
  % Rest during trumpet sweep (Staff will be hidden)
  R4*5 |
  
  \time 4/4
  % Rest during the two-bar funk intro
  R1*2 |
  
  \repeat volta 2 {
    \set Staff.midiInstrument = #"clavinet"
    % RELAXED MUZZLE: Capped at 25% max volume in MIDI
    \set Staff.midiMaximumVolume = #0.25 
    \set Staff.midiMinimumVolume = #0.0
    
    % Bar 1: Standard Gm7 pattern
    g8\pp\staccato^\markup { \box \bold "Clavinet" } d'8\staccato <f' bes'>8\staccato g8\staccato d'8\staccato <f' bes'>8\staccato d'8\staccato g8\staccato |
    
    % Bar 2: Doubling walking Bassline
    g8\staccato g8\staccato bes8\staccato bes8\staccato c'8\staccato c'8\staccato des'8\tenuto( d'8\staccato) |
    
    % Bar 3: Bb6/9 Pattern
    bes8\staccato f'8\staccato <g' d''>8\staccato bes8\staccato f'8\staccato <g' d''>8\staccato f'8\staccato bes8\staccato |
    
    % Bar 4: Doubling Turnaround Bassline
    g'8\tenuto( f'8\staccato) d'8\staccato des'8\staccato c'8\tenuto( d'8\staccato) bes8\staccato g8\staccato |
  }
}

leftHand = {
  \clef treble 
  \time 4/4

  % --- SECTION 1: CREEPY ---
  \set Staff.instrumentName = #"Rhodes / Bass"
  \set Staff.shortInstrumentName = #"Rho."
  \set Staff.midiInstrument = #"electric piano 1"
  
  % Bar 1
  <c'~ e'~ gis'>4\ppp\sustainOn^\markup { \box \bold "Rhodes" } <c' e'~ g'~>4 <b e'~ g'>4 <bes e'>4\sustainOff |
  
  % Bar 2
  a'4( a4)~ <a c'>4~ <a c' ees'>4~ |
  
  % Bar 3
  <a c' ees' g'>1\fermata | 
  
  % --- SECTION 1B: DOUBLE TRUMPET SWEEP (BAR 4) ---
  \time 5/4
  \set Staff.midiInstrument = #"trumpet"
  
  % MAGIC: Cap bottom sweep Open Trumpet to 70% 
  \set Staff.midiMaximumVolume = #0.7
  \set Staff.midiMinimumVolume = #0.0
  
  <<
    {
      f'8\ppp\staccatissimo\marcato^\markup { \box \bold "Trump 2 + DX7" } f8\tenuto\marcato g'8\staccatissimo\marcato 
      bes16\tenuto( c'16\staccato) e'16\tenuto( f'16\staccato) 
      des'16\tenuto( d'16\staccato) f'16\staccato e'16\staccato 
      
      \tag #'print {
        g'16\staccato c'16\staccato bes16\staccato g16\staccato r8 |
      }
      \tag #'midi {
        \tempo 4 = 85 g'16\staccato
        \tempo 4 = 70 c'16\staccato 
        \tempo 4 = 55 bes16\staccato
        \tempo 4 = 40 g16\staccato
        \tempo 4 = 90 r8 |
      }
    }
    \tag #'midi {
      \new Staff {
        \set Staff.midiInstrument = #"electric piano 2"
        % MAGIC: Cap bottom sweep hidden DX7 to 70%
        \set Staff.midiMaximumVolume = #0.7
        \set Staff.midiMinimumVolume = #0.0
        
        f'8\ppp\staccatissimo\marcato f8\tenuto\marcato g'8\staccatissimo\marcato 
        bes16\tenuto( c'16\staccato) e'16\tenuto( f'16\staccato) 
        des'16\tenuto( d'16\staccato) f'16\staccato e'16\staccato 
        g'16\staccato c'16\staccato bes16\staccato g16\staccato r8 |
      }
    }
  >>
  
  \clef bass

  % --- SECTION 2: FUNKY ---
  \time 4/4
  \set Staff.shortInstrumentName = #"Bass"
  
  % MAGIC: Keep Bass at 100% Volume Ceiling
  \set Staff.midiMaximumVolume = #1.0
  \set Staff.midiMinimumVolume = #0.5
  
  << 
    { 
      \set Staff.midiInstrument = #"electric bass (finger)"
      s4. bes,4.\staccato bes,8\staccato bes,8\staccato 
    } 
    \\ 
    % Bass hits bumped to \fff
    { g,1\fff_\markup { \box \bold "Electric Bass" } } 
  >> | 

  g,4\staccato ges8\tenuto g8\staccato des8\tenuto d8\staccato bes,8\tenuto b,8\staccato |
  
  \repeat volta 2 {
    \set Staff.midiInstrument = #"electric bass (finger)"
    
    % Bass dynamics pushed to \fff
    bes,4\fff\staccato bes,8( g,4.) c8 d8\staccato |
    
    g,8\staccato g,8\staccato bes,8\staccato bes,8\staccato c8\staccato c8\staccato des8\tenuto( d8\staccato) |
    <<
      { r4 bes,8\fff bes,4 bes,4. } 
      \\ 
      { bes,,1\ff } 
    >> |
    
    % Turnaround pushed to \fff
    g8\fff\tenuto( f8\staccato) d8 des8 c8\tenuto( d8\staccato) bes,8 g,8 |
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
