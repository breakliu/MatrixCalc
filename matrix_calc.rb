class MatrixCalc
  def initialize(array)
    @array = array
  end

  def calc
    if matrix?
      result = 0
      @row = 0
      @col = 0

      init_steps

      # 超始方向是1(右:1, 下:2, 左:3, 上:4)
      @direction = 1
      begin
        mark_step
        result += @array[@row][@col]
      end while next_step

      result
    else
      'The array is not a matrix'
    end
  end

  private

  # 简单地对输入数据进行验证
  def matrix?
    if @array == [[]] or not @array.is_a?(Array) or not @array.first.is_a?(Array)
      false
    elsif @array.map { |row| row.size }.uniq.count > 1
      false
    else
      true
    end
  end

  # 记录走过的脚步，初始化为0
  def init_steps
    @rows = @array.size
    @cols = @array.first.size
    @steps = ([0] * @rows * @cols).each_slice(@cols).to_a
  end

  # 走过了标记为1
  def mark_step
    @steps[@row][@col] = 1
  end

  def next_step
    # 如果不能前进, 最多尝试四次, 即四个方向, 也就是在结束点转一圈
    4.times.each do
      case @direction
        when 1
          right
        when 2
          down
        when 3
          left
        when 4
          up
      end

      if @steps[@row][@col] == 0
        return true
      else
        if @direction == 4
          @direction = 1
        else
          @direction += 1
        end
      end
    end

    # 到达这里，证明矩阵已经算完了
    false
  end

  # 下面四个方法为判断能否往相应的方向前进

  def right
    #p "current: [#{@row}][#{@col}]. want to right [#{@row}][#{@col+1}]"
    @col += 1 if @col+1 < @cols and @steps[@row][@col+1] == 0
  end

  def down
    #p "current: [#{@row}][#{@col}]. want to down [#{@row+1}][#{@col}]"
    @row += 1 if @row+1 < @rows and @steps[@row+1][@col] == 0
  end

  def left
    #p "current: [#{@row}][#{@col}]. want to left [#{@row}][#{@col-1}]"
    @col -= 1 if @col-1 >= 0 and @steps[@row][@col-1] == 0
  end

  def up
    #p "current: [#{@row}][#{@col}]. want to up [#{@row-1}][#{@col}]"
    @row -= 1 if @row-1 >= 0 and @steps[@row-1][@col] == 0
  end
end

#matrix = MatrixCalc.new(
  #[
    #[12,32,9,11,34],
    #[8,54,76,23,07],
    #[27,18,25,9,43],
    #[11,23,78,63,19],
    #[9,22,56,31,05]
  #]
#)

#p matrix.calc
