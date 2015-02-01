require 'spec_helper'


module NaiveBayesClassifier
  describe Gaussian do
    let(:training_data) do
      {
        male: [
          {height: 6.00, weight: 180, foot_size: 12},
          {height: 5.92, weight: 190, foot_size: 11},
          {height: 5.58, weight: 170, foot_size: 12},
          {height: 5.92, weight: 165, foot_size: 10}
        ],
        female: [
          {height: 5.00, weight: 100, foot_size: 6},
          {height: 5.50, weight: 150, foot_size: 8},
          {height: 5.42, weight: 130, foot_size: 7},
          {height: 5.75, weight: 150, foot_size: 9}
        ]
      }
    end 
    let(:classifier) { Gaussian.new }

    before do
      training_data.each do |k, v|
        classifier.train! k, v
      end
    end

    it "returns a correct classification" do
      expect(
        classifier.classify({height: 6, weight: 130, foot_size: 9})
      ).to eq(:female)
    end
  end
end
