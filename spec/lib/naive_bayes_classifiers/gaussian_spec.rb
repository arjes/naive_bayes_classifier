require 'spec_helper'


module NaiveBayesClassifier
  describe Gaussian do
 
    let(:classifier) { Gaussian.new }

    describe "#validate_feature_set" do
      it "intializes the features if not already set" do
        expect{ 

          classifier.validate_feature_set({hand: 0.6, foot: 0.2, mouth: "Asdf"} )

        }.to change{classifier.features}.from([]).to([:hand, :foot, :mouth])
            
      end  
    end
  end
end
