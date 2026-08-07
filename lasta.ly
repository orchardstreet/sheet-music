\version "2.22.1"

\header {
  title = "Lasta"
  composer = "William M. Lupinacci"
}

% --- NEW: Layout and Page Formatting ---
\paper {
  % Gives the margins some breathing room
  top-margin = 15\mm
  bottom-margin = 15\mm
  left-margin = 15\mm
  right-margin = 15\mm
  
  % Increases the vertical distance between the left and right hand staves slightly
  score-system-spacing.basic-distance = #12
  
  % Increases the vertical distance between different lines of music
  system-system-spacing.basic-distance = #18
}

rightHand = {
  \clef treble
  \time 4/4
  
  % SECTION 1: Descent
  \tempo "Creepy" 4 = 90
  % Starts at maximum volume (\ffff) and decrescendos (\>) down to \mf
  <c'~ e'~ gis'>4\ffff\>\sustainOn <c' e'~ g'~>4 <b e'~ g'>4 <bes e'>4\mf\sustainOff |
  
  % Ascent
  % Legato slur connecting the high A to the lower A: a'4( a4)
  % Builds from that \mf with a crescendo (\<) to \ffff on the fermata
  a'4\<( a4)~ <a c'>4~ <a c' ees'>4~ |
  <a c' ees' g'>1\fermata\ffff | 
  
  % =====================================================================
  \break % --- FORCED LINE BREAK 1: Puts the first 3 bars on their own line
  % =====================================================================
  
  % --- COMBINED BARS 4 & 5 (Now 6/4 Time) ---
  % 6-beat measure to un-cramp the run and cut the dead space at the end
  \time 6/4
  % =====================================================================
  % The 16th note run is tripled in octaves, starting pianissimo (\pp) for a massive dynamic contrast
  <f' f'' f'''>8\pp\staccatissimo <f f' f''>8\tenuto <g' g'' g'''>8\staccatissimo 
  <bes bes' bes''>16\tenuto( <c' c'' c'''>16\staccato) <e' e'' e'''>16\tenuto( <f' f'' f'''>16\staccato) 
  <des' des'' des'''>16\tenuto( <d' d'' d'''>16\staccato) <f' f'' f'''>16\portato <e' e'' e'''>16\portato 
  
  % 'print' tag uses the abbreviated text to save horizontal space
  \tag #'print {
    <g' g'' g'''>16^\markup { \bold \italic "poco a poco rit." }\< <c' c'' c'''>16 
    <bes bes' bes''>16 <g g' g''>16\f r8 r4 |
  }
  % 'midi' tag progressively stair-steps the tempo down for EACH individual note
  \tag #'midi {
    \tempo 4 = 85 <g' g'' g'''>16\<
    \tempo 4 = 70 <c' c'' c'''>16 
    \tempo 4 = 55 <bes bes' bes''>16
    \tempo 4 = 40 <g g' g''>16\f 
    \tempo 4 = 90 % Snaps back to 90 for the rests
    r8 r4 |
  }
  % =====================================================================
  
  % =====================================================================
  \break % --- FORCED LINE BREAK 2: Gives 6/4 run its own dedicated line
  % =====================================================================
  
  % --- PRE-FUNKY BASS PICKUP (2 Bars) ---
  \time 4/4
  % Tempo shifts to 125 BPM here, the word "Funky" is saved for the groove
  \tempo 4 = 125 
  % Bar 1 (Visually Bar 5): F holds through beat 2. B-flat, G, and the final F stack and tie forward.
  f'4\f~ <bes~ f'>4 <bes~ g'~>4 <bes f' g'>4~ | 
  
  % Bar 2 (Visually Bar 6): 
  % The crescendo starts on beat 1, but the \! on the s4 forces it to stop 
  % a beat early, pulling it back from the right edge of the measure
  << { <bes f' g'>1 } { s2.\< s4\! } >> | 

  % SECTION 2: The Groove
  % Looping the last four measures 2 times total (1 initial play + 1 repeat)
  \repeat volta 2 {
    % =====================================================================
    % Measure 1 (The 4th to last bar of the song)
    \tempo "Funky"
    % Melody doubled in octaves! A, G, D (descending)
    % Syncopated 3-over-4 rhythm!
    <a' a''>4.\p\< <g' g''>4. <d' d''>4 |
    % =====================================================================

    % Measure 2 
    % Caps off the crescendo at Mezzo-Piano (\mp)
    <g' g''>1\mp |

    % =====================================================================
    % Measure 3 
    % Texture thins out - reverted back to single notes!
    g'4. f'4 d'8 c'8 g'8 |

    % Measure 4 
    % Rings out for the full 4 beats as a single note!
    f'1\< |
    % =====================================================================
  }
}

leftHand = {
  \clef bass
  \time 4/4

  % Section 1 Left Hand 
  R1 | % Measure 1: Rest while the massive dissonant chord drops
  R1 | % Measure 2: Bass removed, leaving right hand exposed
  R1 | % Measure 3: Rest without the fermata hold notation
  
  % --- COMBINED BARS 4 & 5 (Now 6/4 Time) ---
  \time 6/4
  R1*6/4 | % Measure 4 (visually): 6 total beats of rest to match the right hand's shortened measure

  % --- PRE-FUNKY BASS PICKUP (2 Bars) ---
  \time 4/4
  % Measure 5 (visually): Two half notes tied across the barline
  g,2\mp g,2~ | 

  % chromatic walkdown with legato slurs removed for a punchier feel
  g,4 ges8\tenuto g8\staccato des8\tenuto d8\staccato bes,8\tenuto b,8\staccato |
  
  % Looping the last four measures 2 times total (1 initial play + 1 repeat)
  \repeat volta 2 {
    % =====================================================================
    % Measure 1 (The 4th to last bar of song)
    % Sub-bass removed completely to let the main bassline punch through!
    bes,4\staccato bes,8( g,4) r8 c8 d8 |
    % =====================================================================

    % =====================================================================
    % Measure 2 (The 3rd to last bar of song)
    % Sub-bass drone removed, exposing the punchy ascending 8th-note walk-up!
    g,8\staccato g,8\staccato bes,8 bes,8 c8 c8 des8 d8 |
    % =====================================================================

    % =====================================================================
    % Measure 3 (The 2nd to last bar of song)
    % Lower Voice RESTORED to a deep, heavy B-flat sub-rumble!
    <<
      % Upper Voice: The syncopated hits (stems will point up)
      { r4 bes,8\mp bes,4 bes,4. } 
      \\ 
      % Lower Voice: The deep B-flat sub-rumble!
      { bes,,1\pp }
    >> |
    % =====================================================================

    % =====================================================================
    % Measure 4 (The final bar of song): Turnaround riff
    g8\mp\<\tenuto( f8\staccato) d8 des8 c8\tenuto( d8\staccato) bes,8 g,8 |
    % =====================================================================
  }
}

% --- SCORE 1: For the visual sheet music (keeps the repeat signs clean and 8ths straight) ---
\score {
  \keepWithTag #'print
  \new PianoStaff <<
    \new Staff = "right" \rightHand
    \new Staff = "left" \leftHand
  >>
  \layout { 
    \context {
      \Score
      % --- Horizontal Spacing Fix ---
      % Forces LilyPond to calculate spacing based on 16th notes, un-cramping the measures
      \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/16)
      
      % --- Cautionary Time Signature Fix ---
      % Prevents the time signature from printing twice if a measure breaks across lines
      \override TimeSignature.break-visibility = #end-of-line-invisible
    }
  }
}

% --- SCORE 2: For the MIDI playback (forces the repeats to play and applies the tempo drop) ---
\score {
  \keepWithTag #'midi
  \unfoldRepeats {
    \new PianoStaff <<
      \new Staff = "right" \rightHand
      \new Staff = "left" \leftHand
    >>
  }
  \midi { }
}
