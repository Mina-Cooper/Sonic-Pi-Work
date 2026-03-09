num = 21
use_synth :piano

87.times do
  play(num)
  sleep 0.5
  num = num + 1
end
