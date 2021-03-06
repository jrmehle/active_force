require 'active_force/association/association'
require 'active_force/association/has_many_association'
require 'active_force/association/belongs_to_association'

module ActiveForce
  module Association

    def associations
      @associations ||= {}
    end

    # i.e name = 'Quota__r'
    def find_association name
      name = name.gsub "__r", ""
      associations.values.detect do |association|
        association.relation_model.name == name
      end
    end

    def has_many relation_name, options = {}
      associations[relation_name] = HasManyAssociation.new(self, relation_name, options)
    end

    def belongs_to relation_name, options = {}
      associations[relation_name] = BelongsToAssociation.new(self, relation_name, options)
    end

  end
end
