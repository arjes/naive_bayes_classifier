

module NaiveBayesClassifier
  class Gaussian
    DEFAULT_OPTIONS = {
      default_features: [],
      error_on_feature_mismatch: false
    }

    attr_accessor :training_sets, :statistics, :options
    attr_reader :features

    def initialize options = {}
      self.options       = DEFAULT_OPTIONS.merge(options)
      self.training_sets = Hash.new{|h, k| h[k] = [] }
      self.statistics    = {}
      self.features      = self.options[:default_features]
    end

    def validate_feature_set training_hash
      self.features = training_hash.keys  if self.features.empty?
      
      self.features == training_hash.keys.sort
    end

    def calcualte_statistics_for klass
      self.statistics[klass] = self.features.each_with_object({}) do |feature, obj|
        feature_values = self.training_sets[klass].map{|ts| ts[feature] }

        obj[feature] = {
          variance: ClassifierMath.variance(feature_values),
          mean: ClassifierMath.mean(feature_values)
        }
      end
    end

    def train! klass, training_sets
      training_sets = prune_training_sets(training_sets)

      self.training_sets[klass.to_sym] << training_sets

      calcualte_statistics_for klass
    end

    def features= features
      @features = features.sort
    end

    def prune_training_sets training_sets
      valid_sets = training_sets.select do |training_set|
        validate_feature_set training_set
      end
      
      if self.options[:error_on_feature_mismatch] and
          valid_sets.length != training_sets.length

        raise ArgumentError, 
          "Training set features differs in keys from #{self.features}" 
      end

      valid_sets
    end
  end
end
