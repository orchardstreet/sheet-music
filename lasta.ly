\version "2.22.1"

\header {
  title = "Lasta"
  composer = "William Lupinacci"
}

% --- Layout and Page Formatting ---
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
  
  % --- SECTION 1: INTRO ---
  \set Staff.instrumentName = #"Muted Trumpet"
  \set Staff.shortInstrumentName = #"Mut.Trp."
  
  \set Staff.midiInstrument = #"muted trumpet"
  \set Staff.midiMaximumVolume = #0.3
  \set Staff.midiMinimumVolume = #0.0
  
  % Establish the exact BPM at the very start of the track
  \tempo 4 = 100 
  
  % Bar 1 & 2 (Intro) - Now played on Rhodes!
  R1 |
  R1 |
  
  % Bar 3 (Original Bar 1 - The Crash)
  gis'4.\mp\<^\markup { \box \bold "Muted Trumpet" } g'4. e'4\mf |
  
  % Bar 4
  a'4\mp\<( a4 c'4 ees'4) |
  
  % Bar 5
  g'1\fermata\mf | 
  
  \break % --- FORCED LINE BREAK 1 ---
  
  % --- SECTION 1B: TRUMPET + DX7 SWEEP (BAR 6) ---
  % Update the margin label for this system!
  \set Staff.shortInstrumentName = #"Op.Trp.1+DX7"
  
  % A perfect 8/4 measure!
  \time 8/4
  \ottava #1
  
  \set Staff.midiInstrument = #"trumpet"
  \set Staff.midiMaximumVolume = #0.7
  \set Staff.midiMinimumVolume = #0.0
  
  <<
    {
      f''8\ppp\staccatissimo\marcato^\markup { \box \bold "Open Trumpet 1 + DX7" } f'8\tenuto\marcato g''8\staccatissimo\marcato 
      bes'16\tenuto( c''16\staccato) e''16\tenuto( f''16\staccato) 
      des''16\tenuto( d''16\staccato) f''16\tenuto( e''16\staccato) 
      g''16\tenuto( c''16\staccato) bes'16\tenuto( g'16\staccato) r2. r8 |
    }
    \tag #'midi {
      \new Staff {
        \set Staff.midiInstrument = #"electric piano 2"
        \set Staff.midiMaximumVolume = #0.7
        \set Staff.midiMinimumVolume = #0.0
        
        f''8\ppp\staccatissimo\marcato f'8\tenuto\marcato g''8\staccatissimo\marcato 
        bes16\tenuto( c'16\staccato) e'16\tenuto( f'16\staccato) 
        des'16\tenuto( d'16\staccato) f'16\tenuto( e'16\staccato) 
        g'16\tenuto( c'16\staccato) bes16\tenuto( g16\staccato) r2. r8 |
      }
    }
  >>
  
  \ottava #0
  \break % --- FORCED LINE BREAK 2 ---
  
  % --- SECTION 2: FUNKY ---
  \time 4/4
  
  % Switch label for the Funk Section
  \set Staff.shortInstrumentName = #"Rho."
  \set Staff.midiInstrument = #"electric piano 1"
  
  \set Staff.midiMaximumVolume = #1.0
  \set Staff.midiMinimumVolume = #0.2
  
  % Reveal the tempo marking again for the funk section
  \tempo "Funky" 4 = 130
  f'4\ff^\markup { \box \bold "Rhodes" }~ <bes~ f'>4 <bes~ g'~>4 <bes f' g'>4~ | 
  << { <bes f' g'>1 } { s2.\< s4\! } >> | 
  
  \pageBreak % --- FORCED PAGE BREAK BEFORE REPEAT ---

  \repeat volta 4 {
    \tempo "Funky" % Tempoless label to remind the players on Page 2!
    a'8\ff r4 g'8 r4 d'4( |
    g'1) |
    g'8 r4 f'8 r8 d'8( c'8 g'8 |
    f'1) |
  }
}

clavinetPart = {
  \clef treble
  \set Staff.instrumentName = #"Clavinet"
  \set Staff.shortInstrumentName = #"Clav."
  
  \time 4/4
  % Resting for 5 bars (2 for solo intro, 3 for crash section)
  R1*5 |
  
  \time 8/4
  R4*8 |
  
  \time 4/4
  
  \set Staff.midiInstrument = #"clavinet"
  \set Staff.midiMaximumVolume = #0.35 
  \set Staff.midiMinimumVolume = #0.0
  
  << 
    { 
      s4. bes,4.\staccato bes,8\staccato bes,8\staccato 
    } 
    \\ 
    { g,1\ff^\markup { \box \bold "Clavinet" } } 
  >> | 

  g,4\staccato ges8\tenuto g8\staccato des8\tenuto d8\staccato bes,8\tenuto b,8\staccato |
  
  \repeat volta 4 {
    g8\pp\staccato d'8\staccato <f' bes'>8\staccato g8\staccato d'8\staccato <f' bes'>8\staccato d'8\staccato g8\staccato |
    g8\staccato g8\staccato bes8\staccato bes8\staccato c'8\staccato c'8\staccato des'8\tenuto( d'8\staccato) |
    bes8\staccato f'8\staccato <g' d''>8\staccato bes8\staccato f'8\staccato <g' d''>8\staccato f'8\staccato bes8\staccato |
    g8\tenuto( f8\staccato) d8\tenuto( des8\staccato) c8\tenuto( d8\staccato) bes8\tenuto( g8\staccato) |
  }
}

leftHand = {
  \clef treble 
  \time 4/4

  \set Staff.instrumentName = #"Rhodes" 
  \set Staff.shortInstrumentName = #"Rho."
  \set Staff.midiInstrument = #"electric piano 1"
  
  % Bar 1: Ascending C-G-B, Octave up B-D, landing on A (eighth note) with a hard quarter rest!
  c'8\p\<^\markup { \box \bold "Rhodes" } g'8 b'8 b''8\f d'''8 a''8 r4 |
  
  % Bar 2: Starting C#, expanding upwards, cascading down, and dropping to C# (half-step approach from above)!
  cis'8\mf aes'8 f''8 dis'''8 cis'''8 gis''8 f''8 cis''8 |
  
  % Bar 3 (Original Bar 1 - The Crash) "E" is now tied from the 3rd chord into the final upbeat!
  <c'~ e'~ gis'>4.\ppp\< <c' e' g'~>4. <e'~ g'>8 e'8\p |
  
  % Bar 4
  a'4\ppp\<( a4)~ <a c'>4~ <a c' ees'>4~ |
  
  % Bar 5
  <a c' ees' g'>1\fermata\mf | 
  
  % --- SECTION 1B: TRUMPET + DX7 SWEEP (BAR 6) ---
  \time 8/4
  
  % Update the margin label for this system!
  \set Staff.shortInstrumentName = #"Op.Trp.2+DX7"
  
  \set Staff.midiInstrument = #"trumpet"
  \set Staff.midiMaximumVolume = #0.7
  \set Staff.midiMinimumVolume = #0.0
  
  <<
    {
      f'8\ppp\staccatissimo\marcato^\markup { \box \bold "Open Trumpet 2 + DX7" } f8\tenuto\marcato g'8\staccatissimo\marcato 
      bes16\tenuto( c'16\staccato) e'16\tenuto( f'16\staccato) 
      des'16\tenuto( d'16\staccato) f'16\tenuto( e'16\staccato) 
      g'16\tenuto( c'16\staccato) bes16\tenuto( g16\staccato) r2. r8 |
    }
    \tag #'midi {
      \new Staff {
        \set Staff.midiInstrument = #"electric piano 2"
        \set Staff.midiMaximumVolume = #0.7
        \set Staff.midiMinimumVolume = #0.0
        
        f'8\ppp\staccatissimo\marcato f8\tenuto\marcato g'8\staccatissimo\marcato 
        bes16\tenuto( c'16\staccato) e'16\tenuto( f'16\staccato) 
        des'16\tenuto( d'16\staccato) f'16\tenuto( e'16\staccato) 
        g'16\tenuto( c'16\staccato) bes16\tenuto( g16\staccato) r2. r8 |
      }
    }
  >>
  
  \clef bass

  \time 4/4
  
  % Switch label back for the Funk Section
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
  
  \repeat volta 4 {
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

% --- DEDICATED DRUM TRACK ---
drumPart = \drummode {
  \set DrumStaff.instrumentName = #"Drums"
  \set DrumStaff.shortInstrumentName = #"Dr."
  
  \set DrumStaff.midiMaximumVolume = #0.12
  \set DrumStaff.midiMinimumVolume = #0.0
  
  \time 4/4
  
  % Bar 1 & 2 (Intro): Full measures of rest for the solo
  R1 |
  R1 |
  
  % Bar 3: Split voices! Cymbals dropped to \f and alternated to prevent MIDI choking (bleed effect). Toms stay loud at \ff.
  <<
    { r2 r8 cymc8\f cyms8 cymc8 }
    \\
    { r2 r8 tomh8\ff tommh8 toml8 }
  >> |
  
  % Bar 4 & 5: Tense silence, ending in two massive stick clicks!
  R1 |
  r2 hhc4\fff hhc4 |
  
  % Bar 6 (8/4): The massive snare fill that cuts out early for total silence!
  \time 8/4
  sn8\ff sn8 sn8 
  sn16 sn16 sn16 sn16  sn16 sn16 sn16 sn16  sn16 sn16 sn16 sn16 
  \tuplet 3/2 { sn8 sn8 sn8 } 
  sn8 r2 |
  
  \time 4/4
  
  \set DrumStaff.midiMaximumVolume = #0.2
  \set DrumStaff.midiMinimumVolume = #0.1
  
  <cymc hhc>4\f hhc4\mf hhc4 hhc4 |
  hhc4 hhc4 hhc4 hhc4 |
  
  \set DrumStaff.midiMaximumVolume = #0.2
  \set DrumStaff.midiMinimumVolume = #0.1
  
  % --- VISUAL SCORE (Prints standard 4-bar repeat with text instruction) ---
  \tag #'print {
    \repeat volta 4 {
      <<
        {
          <cymc hhc>4\f^\markup { \italic "Crash 1st x only" } hhc4\mf hhc4 hhc4 | 
          hhc4 hhc4 r2 | % <--- Bar 2 now matches Bar 4!
          hhc4 hhc4 hhc4 hhc4 |
          hhc4 hhc4 r2 | % <--- Bar 4
        }
        \\
        {
          bd4\f r4 sn4\mf r4 |
          bd4\f r4 sn8\mf ss8 sn8 ss8 | % <--- Bar 2 rim-click fill!
          bd4\f r4 sn4\mf r4 |
          bd4\f r4 sn8\mf ss8 sn8 ss8 | % <--- Bar 4 rim-click fill!
        }
      >>
    }
  }
  
  % --- MIDI PLAYBACK (Splits into 1 pass with crash + 3 passes without crash) ---
  \tag #'midi {
    % 1st Pass (With Crash)
    <<
      {
        <cymc hhc>4\f hhc4\mf hhc4 hhc4 | 
        hhc4 hhc4 r2 | 
        hhc4 hhc4 hhc4 hhc4 |
        hhc4 hhc4 r2 | 
      }
      \\
      {
        bd4\f r4 sn4\mf r4 |
        bd4\f r4 sn8\mf ss8 sn8 ss8 |
        bd4\f r4 sn4\mf r4 |
        bd4\f r4 sn8\mf ss8 sn8 ss8 |
      }
    >>
    
    % Remaining 3 Passes (No Crash!)
    \repeat volta 3 {
      <<
        {
          hhc4\mf hhc4\mf hhc4 hhc4 | 
          hhc4 hhc4 r2 | 
          hhc4 hhc4 hhc4 hhc4 |
          hhc4 hhc4 r2 | 
        }
        \\
        {
          bd4\f r4 sn4\mf r4 |
          bd4\f r4 sn8\mf ss8 sn8 ss8 |
          bd4\f r4 sn4\mf r4 |
          bd4\f r4 sn8\mf ss8 sn8 ss8 |
        }
      >>
    }
  }
}

% --- SCORE 1: For the visual sheet music ---
\score {
  \keepWithTag #'print
  <<
    \new StaffGroup <<
      \new Staff = "right" \rightHand
      \new Staff = "clav" \clavinetPart
      \new Staff = "left" \leftHand
    >>
    \new DrumStaff = "drums" \drumPart
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
    <<
      \new StaffGroup <<
        \new Staff = "right" \rightHand
        \new Staff = "clav" \clavinetPart
        \new Staff = "left" \leftHand
      >>
      \new DrumStaff = "drums" \drumPart
    >>
  }
  \midi { 
    \context {
      \Score
      midiChannelMapping = #'instrument
    }
  }
}
