module NNTrainer



		def	calculate_error_vec(output, expected)
				ret = []
				output.each_with_index do |e,i|
						ret << (output[i].abs - expected[i].abs).abs
				end
				#puts ret
				return ret

		end

		def calculate_error_total(output, expected)
				calculate_error_vec(output,expected).inject(:+)
		end

		def train0(min, max, iterations, input, expected)

				puts "training with method 0"
				puts "======================"

				input(input)

				puts "layers #{depth} "
				puts "nodes  #{@layers[0].size}"
				connections_num = ( @layers[0].units.length**2) * (@layers.length - 1)
				puts "connections #{connections_num}"


				error = 0
				best_weights =nil
				first = true

				iterations.times do

						# Reset the network
						reset
						# Generate and set new values
						weights = rand_array(min, max, connections_num)
						#puts "setting #{weights.length} weights betweeen #{weights.min} and #{weights.max}"
						#puts weights

						connect_all_predefined( weights)
						#puts weights.inject(:+)

						# Run
						output = run

						# Calculate error
						current_error = calculate_error_total(output, expected)

						# Save results if better
						if error > current_error or first
								puts "setting new error"
								best_weights = weights
								error = current_error
						end
						first = false

						puts " error current: #{current_error} best: #{error}"

				end

				puts "training with method 0 complete"
				puts "======================"


		end

		def rand_array(min, max, length)

				length.times.map{ min + Random.rand(max-min + 1) }

		end

		def train1
				#Hebb-Regel
		end

		def train2
				#Delta-Regel
		end

		def train3
				#Backpropagation
		end

		def train4
				#Competitive Learning
		end

end
