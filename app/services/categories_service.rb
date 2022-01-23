class CategoriesService
    def self.categoryList
        @categories = CategoriesRepository.getCategoryList
    end

    def self.categoryDetail(id)
        @category = CategoriesRepository.getCategoryDetail(id)
    end

    def self.createCategory(category_params)
        category = Category.new(category_params)
        isSaveCategory = CategoriesRepository.createCategory(category)
    end

    def self.editCategory(id)
        @category = CategoriesRepository.getCategoryId(id)
    end

    def self.updateCategory(id, category_params)
        category = CategoriesRepository.getCategoryId(id)
        isUpdateCategory = CategoriesRepository.updateCategory(category)
    end

    def self.destroyCategory(id)
        category = CategoriesRepository.getCategoryId(id)
        isDeleteCategory = CategoriesRepository.destroyCategory(category)
    end
end