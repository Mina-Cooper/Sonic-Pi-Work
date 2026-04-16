#witch

use_bpm 120
use_synth :hollow

crow1 = "C:/Users/Mina_Cooper/Downloads/crow1.wav"
crow2 = "C:/Users/Mina_Cooper/Downloads/crow2.wav"
crow3 = "C:/Users/Mina_Cooper/Downloads/crow3.wav"
fire = "C:/Users/Mina_Cooper/Downloads/fire.wav"

define :changingNotes do |n|
  play :c5
  sleep 1
  play n
end

secondRowNotes = [:g3, :b3, :g3, :b2, :b2, :b2, :b2,]
secondRowSleeps = [2, 2, 2, 1, 1, 1, 1]
sb = 0

v = 0.1

define :outro do
  play :g4, amp: v
  play :d4, amp: v
  sleep 2.5
  
  play :f4, amp: v
  play :c4, amp: v
  sleep 2.5
  
  play :f4, amp: v
  play :d4, amp: v
  sleep 2.5
  
  play :f4, amp: v
  play :d4, amp: v
  sleep 2.5
end

#actual song start

sample crow1
sleep 3
sample crow2
sleep 6

sleep 4

live_loop :row1 do
  3.times do
    #first measure
    play :f5
    sleep 2.5
    
    play :d5
    sleep 0.5
    
    play :e5
    sleep 1
    
    play :a5
    sleep 0.5
    
    play :g5
    sleep 1
    
    play :a5
    sleep 0.5
    
    #second measure
    play :f5
    sleep 3
    
    play :f5
    sleep 1
    
    play :g5
    sleep 1
    
    play :e5
    sleep 1
    
    play :d5
    sleep 0.5
    
    play :e5
    sleep 1
    
    play :f5
    sleep 1
    
    play :g5
    sleep 1
    
    #third measure
    play :f5
    sleep 2
    
    play :a5
    sleep 0.5
    
    play :g5
    sleep 1
    
    play :g5
    sleep 0.5
    
    play :f5
    sleep 1
    
    play :d5
    sleep 0.5
    
    #fourth measure
    changingNotes :d5
    sleep 0.5
    
    changingNotes :f5
    sleep 0.5
    
    changingNotes :f5
    sleep 0.5
    
    changingNotes :b4
    sleep 0.5
  end
  stop
end

sleep 16

live_loop :row2 do
  3.times do
    #all four measures
    7.times do
      play secondRowNotes[sb]
      sleep secondRowSleeps[sb]
      sb = sb + 1
      
      play :f3, amp: 0.7
      sleep 2
    end
    sb = 0
  end
  stop
end

sleep 32

use_synth :rodeo

live_loop :outroNotes do
  3.times do
    outro
    v = v - 0.03
  end
  stop
end

sleep 35
sample crow3
sample fire
