class Brain
  def initialize(neurons_in_layers: [10, 30, 10])
    @neurons_in_layers = neurons_in_layers
    @synapses = generate_synapses
  end

  # here, we take an array full of inputs, in this case 10 different values.
  # do i need to generate some arrays here?
  # so im thinking maybe i go through and


  # i would create a new array with some input data, and then enter that into forward again,
  # recursively
  # how would it generate that array?
  # it would get passed

  # lets think of 1, 2, 1 network
  # we would iterate through initial input,
  # then iterate through as many @synapses as there are neurons in the next layer
  # so we would start the next iteration at
  # the index of the input * the number of neurons in the next layer

  # so when we get to a new neuron, we should push a 0 to the next_layer_of_neurons
  # and add up the weight/bias stuff as we iterate through the current neurons synapses (or weights/biases)
  # then, we insert that resultant array into forward again

  # how do we know when weve created the last array?
  # so, we should pass a few things to forward so it can keep track
  # forward needs to know which layer of weights/biases to iterate over
  # so i think we pass the index of the weights_and_biases layer we want to iterate over,
  # then if @synapses[index].nil? we return the current_neurons that i got
  # cus thatll be the output

  def forward(current_neurons, synapse_index: 0)
    output_neurons = []
    neurons_in_next_layer = @neurons_in_layers[synapse_index + 1]
    current_neurons.each_with_index do |neuron, index|
      output_neurons << 0 #
      synapse_start_index = neurons_in_next_layer * index
      current_synapses(synapse_start_index, neurons_in_next_layer).each do |synapse|
        preactivated_neuron = weigh_and_bias(neuron, synapse)
        output_neurons <<
          activate preactivated_neuron  #need activate method
      end

    end
  end

  # each neuron needs to take the sum of the synapses connected to it,
  # then input that sum into the activation function



  private

  # an array of arrays, where each array is the weights and biases of a layer of synapses
  def generate_synapses
    synapses = []
    number_of_synaptic_layers.times { synapses << [] }
    @neurons_in_layers.each_with_index do |neuron_count, index|
      neurons_in_next_layer = @neurons_in_layers[index + 1]
      break if neurons_in_next_layer.nil?
      (neuron_count * neurons_in_next_layer).times do
        synapses[index] <<
          {
            bias: rand,     # between 0 and 1
            weight: rand    # between 0 and 1
          }
      end
    end
    synapses
  end

  def current_synapses(start_index, next_layer)
    @synapses[start_index..start_index + next_layer]
  end

  def weigh_and_bias(neuron, synapse)
    (neuron * synapse[:weight]) + synapse[:bias]
  end

  def activate(neuron)

  end

  def number_of_layers
    @neurons_in_layers.count
  end

  def number_of_synaptic_layers
    number_of_layers - 1
  end
end
