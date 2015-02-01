require 'spec_helper'


module NaiveBayesClassifier
  describe Gaussian do
 
    let(:classifier) { Gaussian.new }

    describe "#initialize" do
      it "accecpts default features" do
        expect(Gaussian.new(default_features: [:boo]).features).to eq [:boo]
      end
    end

    describe "#train!" do
      it "appends training sets to the training_sets array" do
        expect{
          classifier.train!('foo', [ {omg: '123'} ])
        }.to change{ classifier.training_sets[:foo].length }.from(0).to(1)
      end

      it "only appends valid training sets" do
        expect{
          classifier.train!('foo', [ {omg: '123'}, {foo: 456} ])
        }.to change{ classifier.training_sets[:foo].length }.from(0).to(1)
      end

      it "calls calculate stats once for each call" do
        expect(classifier).to receive(:calcualte_statistics_for).once

        classifier.train!('foo', [ {dude: 123} ])
      end
    end

    describe "#validate_feature_set" do
      it "intializes the features if not already set" do
        expect{ 

          classifier.validate_feature_set({hand: 0.6, foot: 0.2, mouth: "Asdf"} )

        }.to change{classifier.features}.from([]).to([:foot, :hand, :mouth]) 
      end

      it "returns a truthy value if the keys match the existing features" do
        classifier.features = [:foo, :bar]

        expect( classifier.validate_feature_set({foo: 1, bar: 2})).to be_truthy
      end

      it "raises an error if the hash dosn't match the existing features" do
        classifier.features = [:foo, :foo]

        expect( classifier.validate_feature_set({bar: 1, baz: 2}) ).to be_falsy
      end
    end

    describe "#prune_training_sets" do
      let(:training_item1) { {foo: 123} }
      let(:training_item2) { {foo: 123} }

      let(:mismatch_training_item1) { {bar: 456} }
      

      context "when error_on_feature_mismatch is false" do
        let(:classifier) do
          Gaussian.new(default_features: [:foo], error_on_feature_mismatch: false)
        end

        it "raises an error if there is a mismatch" do
          expect(
            classifier.prune_training_sets([training_item1, mismatch_training_item1])
          ).to eq [ training_item1 ]
        end

      end

      context "when error_on_feature_mismatch is set" do
        let(:classifier) do
          Gaussian.new(default_features: [:foo], error_on_feature_mismatch: true)
        end

        it "raises an error if there is a mismatch" do
          expect {
            classifier.prune_training_sets([training_item1, mismatch_training_item1])
          }.to raise_error
        end

        it "returns all training sets if no mismatches found" do
          expect(
            classifier.prune_training_sets([training_item1, training_item2])
          ).to eq [training_item1, training_item2]
        end 
      end
    end
  end
end
