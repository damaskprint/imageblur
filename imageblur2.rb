class Image

  def initialize(ary)
    @image = ary
  end

  def output_image
    @image.each do |row|
      puts row.join
    end
  end

  def blur
    blur_ary = []
    @image.each_with_index do |row, row_num|
       row.each_with_index do |x, col_num|
        blur_ary << [row_num, col_num] if x == 1
      end
    end

    blur_ary.each do |coord|
      @image[coord[0]][coord[1] + 1] = 1 if coord[1] + 1 <= @image[coord[0]].length - 1
      @image[coord[0]][coord[1] - 1] = 1 if coord[1] - 1 >= 0
      @image[coord[0] + 1][coord[1]] = 1 if coord[0] + 1 <= @image.length - 1
      @image[coord[0] - 1][coord[1]] = 1 if coord[0] - 1 >= 0
    end
  end

end

image = Image.new([
  [0, 0, 0, 0, 1, 0],
  [0, 1, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0],
  [1, 0, 0, 0, 0, 1],
  [0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0]
])
image.blur
image.output_image