Unit Game;

interface

uses System, System.Drawing, System.Windows.Forms;

type
  MainForm = class(Form)
    procedure MainForm_Load(sender: Object; e: EventArgs);
    procedure StartButton_Click(sender: Object; e: EventArgs);
    procedure ExitButton_Click(sender: Object; e: EventArgs);
    procedure MainForm_KeyDown(sender: Object; e: KeyEventArgs);
    procedure MainForm_KeyUp(sender: Object; e: KeyEventArgs);
    procedure MoveTimer_Tick(sender: Object; e: EventArgs);
    procedure RestartButton_Click(sender: Object; e: EventArgs);
    procedure MainTimer_Tick(sender: Object; e: EventArgs);
    procedure GameSpeed2_Scroll(sender: Object; e: EventArgs);
    procedure GameSpeed1_Scroll(sender: Object; e: EventArgs);
    procedure PauseButton_Click(sender: Object; e: EventArgs);
    procedure BoostSpeed1_Scroll(sender: Object; e: EventArgs);
    procedure BoostSpeed2_Scroll(sender: Object; e: EventArgs);
    procedure GiveUpButton_Click(sender: Object; e: EventArgs);
  {$region FormDesigner}
  internal
    {$resource Game.MainForm.resources}
    GamePictureBox: PictureBox;
    components: System.ComponentModel.IContainer;
    NextFigurePictureBox: PictureBox;
    ScoreLabel: &Label;
    RestartButton: Button;
    GameOverPanel: Panel;
    GameOverPanelRestartButton: Button;
    GameSpeedLabel1: &Label;
    GameSpeed1: TrackBar;
    GameOverLabel: &Label;
    MainTimer: Timer;
    StartPanel: Panel;
    ExitButton: Button;
    StartButton: Button;
    TitleLabel: &Label;
    GameSpeed2: TrackBar;
    GameSpeedLabel2: &Label;
    PauseButton: Button;
    BoostSpeedLabel2: &Label;
    BoostSpeed2: TrackBar;
    BoostSpeedLabel1: &Label;
    BoostSpeed1: TrackBar;
    ResultScoreLabel: &Label;
    GiveUpButton: Button;
    GameOverCloseButton: Button;
    MoveTimer: Timer;
    {$include Game.MainForm.inc}
  {$endregion FormDesigner}
  public
    constructor;
    begin
      InitializeComponent;
    end;
  end;
  FigureSegment = class 
    X, Y: integer;
    
    constructor(x_, y_: integer);
    begin
      X := x_;
      Y := y_;
    end;
  end;
  Figure = class
    segments: array of FigureSegment;
    figureColor: SolidBrush;
    figureType, rotate: integer;
    figureRotates: array of array of array of integer;
    
    constructor(figureType: integer);
    begin
       self.figureType := figureType;
       rotate := 0;
       if figureType = 1 then begin // Палка
         figureColor := new SolidBrush(Color.FromArgb(0, 183, 222));
         segments := Arr(new FigureSegment(3, 0), new FigureSegment(4, 0), new FigureSegment(5, 0), new FigureSegment(6, 0));
         figureRotates := Arr(
            Arr(Arr(0,0),Arr(0,1),Arr(0,2),Arr(0,3)),
            Arr(Arr(0,0),Arr(1,0),Arr(2,0),Arr(3,0))
         );
       end
       
       else if figureType = 2 then begin // Квадрат
         figureColor := new SolidBrush(Color.FromArgb(254, 229, 44));
         segments := Arr(new FigureSegment(4, 0), new FigureSegment(5, 0), new FigureSegment(4, 1), new FigureSegment(5, 1));
       end
       
       else if figureType = 3 then begin // Палка с хвостиком слева
         figureColor := new SolidBrush(Color.FromArgb(0, 96, 200));
         segments := Arr(new FigureSegment(5, 1), new FigureSegment(5, 0), new FigureSegment(5, 2), new FigureSegment(4, 2));
         figureRotates := Arr(
            Arr(Arr(0,0),Arr( 1, 0),Arr(-1, 0),Arr(-1,-1)),
            Arr(Arr(0,0),Arr( 0,-1),Arr( 0, 1),Arr( 1,-1)),
            Arr(Arr(0,0),Arr(-1, 0),Arr( 1, 0),Arr( 1, 1)),
            Arr(Arr(0,0),Arr( 0,-1),Arr( 0, 1),Arr(-1, 1))
         );
       end
       
       else if figureType = 4 then begin // Палка с хвостиком справа
         figureColor := new SolidBrush(Color.FromArgb(255, 166, 8));
         segments := Arr(new FigureSegment(4, 0), new FigureSegment(4, 1), new FigureSegment(4, 2), new FigureSegment(5, 2));
         figureRotates := Arr(
            Arr(Arr(0,0),Arr(-1, 0),Arr(-1, 1),Arr( 1, 0)),
            Arr(Arr(0,0),Arr(-1,-1),Arr( 0,-1),Arr( 0, 1)),
            Arr(Arr(0,0),Arr(-1, 0),Arr( 1, 0),Arr( 1,-1)),
            Arr(Arr(0,0),Arr( 0,-1),Arr( 0, 1),Arr( 1, 1))
         );
       end
       
       else if figureType = 5 then begin // Z 
         figureColor := new SolidBrush(Color.FromArgb(243, 19, 5));
         segments := Arr(new FigureSegment(5, 1), new FigureSegment(4, 0), new FigureSegment(5, 0), new FigureSegment(6, 1));
         figureRotates := Arr(
            Arr(Arr(0,0),Arr( 1,-1),Arr( 1, 0),Arr( 0, 1)),
            Arr(Arr(0,0),Arr(-1,-1),Arr( 0,-1),Arr( 1, 0))
         );
       end
       
       else if figureType = 6 then begin // Z в другую сторону
         figureColor := new SolidBrush(Color.FromArgb(2, 198, 54));
         segments := Arr(new FigureSegment(5, 1), new FigureSegment(5, 0), new FigureSegment(4, 1), new FigureSegment(6, 0));
         figureRotates := Arr(
            Arr(Arr(0,0),Arr( 0,-1),Arr( 1, 0),Arr( 1, 1)),
            Arr(Arr(0,0),Arr(-1, 0),Arr( 0,-1),Arr( 1,-1))
         );
       end
       
       else if figureType = 7 then begin // Палка с пипкой
         figureColor := new SolidBrush(Color.FromArgb(166, 25, 188));
         segments := Arr(new FigureSegment(5, 0), new FigureSegment(4, 1), new FigureSegment(5, 1), new FigureSegment(6, 1));
         figureRotates := Arr(
            Arr(Arr(0,0),Arr( 0,-1),Arr( 1, 0),Arr( 0, 1)),
            Arr(Arr(0,0),Arr(-1, 0),Arr( 0, 1),Arr( 1, 0)),
            Arr(Arr(0,0),Arr( 0,-1),Arr(-1, 0),Arr( 0, 1)),
            Arr(Arr(0,0),Arr(-1, 0),Arr( 0,-1),Arr( 1, 0))
         );
       end;
    end;
    
    procedure rotateFigure(figures:array of Figure);
    begin
      var rotatePoint := segments[0];
      var newSegments:array of FigureSegment;
      
      if figureType <> 2 then begin 
         newSegments := Arr(
            new FigureSegment(rotatePoint.x+figureRotates[rotate][0][0], rotatePoint.y+figureRotates[rotate][0][1]),
            new FigureSegment(rotatePoint.x+figureRotates[rotate][1][0], rotatePoint.y+figureRotates[rotate][1][1]),
            new FigureSegment(rotatePoint.x+figureRotates[rotate][2][0], rotatePoint.y+figureRotates[rotate][2][1]),
            new FigureSegment(rotatePoint.x+figureRotates[rotate][3][0], rotatePoint.y+figureRotates[rotate][3][1])
         );
         
         var newFigureCanFit := true;
      
         foreach var i in newSegments do begin
           foreach var f in figures do begin
             foreach var s in f.segments do begin
               if ((i.x = s.x) and (i.y = s.y)) or (i.y < 0) or (i.y > 19) or (i.x < 0) or (i.x > 9) then newFigureCanFit := false
             end;
           end;
         end;
         
         if newFigureCanFit then begin
           
           if (figureType = 1) or (figureType = 5) or (figureType = 6) then begin
               if rotate  = 0 then rotate := 1
               else rotate := 0
           end
           else begin
                    if rotate = 3 then rotate := 0
               else if rotate = 2 then rotate := 3
               else if rotate = 1 then rotate := 2
               else if rotate = 0 then rotate := 1
           end;
             
           segments := newSegments;
         end;
      end;
    end;
    
    procedure moveFigure(direction:string; figures:array of Figure; callback:procedure);
    begin
      var minX := 10;
      var maxX := 0;
      var maxY := 0;
      
      foreach var i in segments do begin
        if i.x < minX then minX := i.x;
        if i.x > maxX then maxX := i.x;
        if i.y > maxY then maxY := i.y;
      end;
      
      var intersectsOtherSegments := false;
      
      if (direction = 'left') and (minX > 0) then begin
        
        foreach var i in segments do begin
          foreach var f in figures do begin
            foreach var s in f.segments do begin
              if (i.x - 1 = s.x) and (i.y = s.y) then intersectsOtherSegments := true
            end;
          end;
        end;
        
        if not intersectsOtherSegments then begin
          foreach var i in segments do begin
            i.x := i.x - 1;
          end;
        end;
      end;
      
      if (direction = 'right') and (maxX < 9) then begin
        
        foreach var i in segments do begin
          foreach var f in figures do begin
            foreach var s in f.segments do begin
              if (i.x + 1 = s.x) and (i.y = s.y) then intersectsOtherSegments := true
            end;
          end;
        end;
        
        if not intersectsOtherSegments then begin
          foreach var i in segments do begin
            i.x := i.x + 1;
          end;
        end;
      end;
      
      if direction = 'down' then begin
        
        foreach var i in segments do begin
          foreach var f in figures do begin
            foreach var s in f.segments do begin
              if (i.y + 1 = s.y) and (i.x = s.x) then intersectsOtherSegments := true
            end;
          end;
        end;
        
        if not intersectsOtherSegments and (maxY < 19) then begin
          foreach var i in segments do begin
            i.y := i.y + 1;
          end;
        end
        else begin
          callback()
        end;
      end;
    end;
  end;

implementation

var gameImage := new Bitmap(301, 601);
var painter := Graphics.FromImage(gameImage);

var nextFigureImage := new Bitmap(190, 190);
var nextFigurePainter := Graphics.FromImage(nextFigureImage);

var bordersColor := new Pen(Color.FromArgb(200, 200, 200));
var segmentBordersColor := new Pen(Color.FromArgb(40, 40, 40));
var railsColor := new Pen(Color.FromArgb(180, 180, 180));

var unitCell := 30;
var xSize := 10;
var ySize := 20;

var score := 0;

var pause := false;

var gameOver := false;

var moveLeft  := false;
var moveRight := false;
var moveDown  := false;

var isKeyDown := false;

var figures := Arr(new Figure(0))[:-1];

var nextFigure    := new Figure(PABCSystem.Random(1,7));
var currentFigure := new Figure(PABCSystem.Random(1,7));

procedure draw();
begin
  painter.Clear(Color.White);
  
  for var y := 0 to 20 do begin
    for var x := 0 to 10 do begin
      painter.drawRectangle(bordersColor, new Rectangle(unitCell*x, unitCell*y, unitCell, unitCell));
    end;
  end;
  
  var minX := 10;
  var maxX := 0;
   
  foreach var i in currentFigure.segments do begin
    if i.x < minX then minX := i.x;
    if i.x > maxX then maxX := i.x;
  end;
  
  painter.DrawLine(railsColor,     minX*unitCell, 0,     minX*unitCell, 601);
  painter.DrawLine(railsColor, (maxX+1)*unitCell, 0, (maxX+1)*unitCell, 601);
  
  foreach var i in currentFigure.segments do begin
    painter.FillRectangle(currentFigure.figureColor, unitCell*i.x, unitCell*i.y, unitCell ,unitCell);
    painter.drawRectangle(segmentBordersColor, new Rectangle(unitCell*i.x, unitCell*i.y, unitCell, unitCell));
  end;
  
  foreach var i in figures do begin
    foreach var j in i.segments do begin
      painter.FillRectangle(i.figureColor, unitCell*j.x, unitCell*j.y, unitCell ,unitCell);
      painter.drawRectangle(segmentBordersColor, new Rectangle(unitCell*j.x, unitCell*j.y, unitCell, unitCell));
    end;
  end;
end;

procedure drawNextFigure();
begin
  nextFigurePainter.Clear(Color.White);
  if nextFigure.figureType = 1 then begin
    foreach var i in nextFigure.segments do begin
      nextFigurePainter.FillRectangle(nextFigure.figureColor, unitCell*(i.x-3)+Round(unitCell/2), unitCell*(i.y+1), unitCell ,unitCell);
      nextFigurePainter.drawRectangle(segmentBordersColor, new Rectangle(unitCell*(i.x-3)+Round(unitCell/2), unitCell*(i.y+1), unitCell, unitCell));
    end;
  end
  else begin
    foreach var i in nextFigure.segments do begin
      nextFigurePainter.FillRectangle(nextFigure.figureColor, unitCell*(i.x-3), unitCell*(i.y+1), unitCell ,unitCell);
      nextFigurePainter.drawRectangle(segmentBordersColor, new Rectangle(unitCell*(i.x-3), unitCell*(i.y+1), unitCell, unitCell));
    end;
  end;
  
end;

procedure MainForm.MainForm_Load(sender: Object; e: EventArgs);
begin
  GamePictureBox.Image := gameImage;
  NextFigurePictureBox.Image := nextFigureImage;
  segmentBordersColor.width := 2;
  railsColor.Width := 2;
  
  draw();
  drawNextFigure();
end;

procedure clearLine(line:integer);
begin
  foreach var f in figures do begin
    var indexesToDelete := Arr(0)[:-1];
    
    for var s := 0 to f.segments.Length-1 do begin
      
      if f.segments[s].y = line then begin
        indexesToDelete := indexesToDelete + Arr(s-indexesToDelete.Length);
      end
      else if f.segments[s].y < line then f.segments[s].y := f.segments[s].y + 1
    end;
    
    foreach var i in indexesToDelete do begin
      f.segments := Arr(f.segments.SplitAt(i)[0] + f.segments.SplitAt(i)[1].Slice(1,1));
    end;
  end;
end;

procedure checkingForCompletedLine();
begin
  for var y := 0 to ySize do begin
    var segmentsCount := 0;
    
    foreach var f in figures do begin
      foreach var s in f.segments do begin
        if s.y = y then segmentsCount := segmentsCount + 1
      end;
    end;
    
    if segmentsCount = 10 then begin
      clearLine(y);
      score := score + 1;
    end;
  end;
end;

procedure createNewFigure();
begin
  foreach var i in currentFigure.segments do begin
    if i.y = 0 then gameOver := true;
  end;
  
  if not gameOver then begin
    figures := figures + Arr(currentFigure);
  
    currentFigure := nextFigure;
    nextFigure := new Figure(PABCSystem.Random(1,7));
     
    checkingForCompletedLine();
     
    drawNextFigure();
  end;
end;

procedure MainForm.MainTimer_Tick(sender: Object; e: EventArgs);
begin
  if not moveDown then currentFigure.moveFigure('down', figures, createNewFigure);
  
  draw();
  
  checkingForCompletedLine();
  
  GamePictureBox.Invalidate;
  NextFigurePictureBox.Invalidate;
  
  ScoreLabel.Text := string.Format('Счёт: {0}',score);
  
  if gameOver then begin
    MainTimer.Enabled := false;
    MoveTimer.Enabled := false;
    ResultScoreLabel.Text := string.Format('Итоговый счёт: {0}', score);
    GameOverPanel.Visible := true;
  end;
end;

procedure MainForm.MoveTimer_Tick(sender: Object; e: EventArgs);
begin
  if moveLeft or moveRight or moveDown then begin
    if moveLeft  then currentFigure.moveFigure('left',  figures, createNewFigure);
    if moveRight then currentFigure.moveFigure('right', figures, createNewFigure);
    if moveDown  then currentFigure.moveFigure('down',  figures, createNewFigure);
    draw();
    GamePictureBox.Invalidate;
    NextFigurePictureBox.Invalidate;
  end;
end;

procedure MainForm.MainForm_KeyDown(sender: Object; e: KeyEventArgs);
begin
  if (e.KeyValue = 38) and not pause then begin
    currentFigure.rotateFigure(figures);
    draw();
    GamePictureBox.Invalidate
  end;
  
  if e.KeyValue = 37 then moveLeft  := true;
  if e.KeyValue = 39 then moveRight := true;
  if e.KeyValue = 40 then moveDown  := true;
  if e.KeyValue = 68 then gameOver  := true;
  
  if not isKeyDown and not pause then begin
    MoveTimer.Enabled := false;
    
    if moveLeft  then currentFigure.moveFigure('left',  figures, createNewFigure);
    if moveRight then currentFigure.moveFigure('right', figures, createNewFigure);
    if moveDown  then currentFigure.moveFigure('down',  figures, createNewFigure);
    draw();
    GamePictureBox.Invalidate;
    NextFigurePictureBox.Invalidate;
    
    MoveTimer.Enabled := true;
  end;
  
  isKeyDown := true;
end;

procedure MainForm.MainForm_KeyUp(sender: Object; e: KeyEventArgs);
begin
  if e.KeyValue = 37 then moveLeft  := false;
  if e.KeyValue = 39 then moveRight := false;
  if e.KeyValue = 40 then moveDown  := false;
  
  isKeyDown := false;
end;

procedure MainForm.StartButton_Click(sender: Object; e: EventArgs);
begin
  MainTimer.Enabled := true;
  MoveTimer.Enabled := true;
  StartPanel.Visible := false;
end;

procedure MainForm.ExitButton_Click(sender: Object; e: EventArgs);
begin
  close
end;

procedure MainForm.GameSpeed1_Scroll(sender: Object; e: EventArgs);
begin
  MainTimer.Interval := GameSpeed1.Value;
  MoveTimer.Interval := Round(GameSpeed1.Value/3);
  
  BoostSpeed1.Value := MoveTimer.Interval;
  BoostSpeed2.Value := MoveTimer.Interval;
  
  BoostSpeedLabel1.Text := string.Format('Скорость при ускорении: {0}', MoveTimer.Interval);
  BoostSpeedLabel2.Text := string.Format('Скорость при ускорении: {0}', MoveTimer.Interval);
  
  GameSpeed2.Value := GameSpeed1.Value;
  GameSpeedLabel1.Text := string.Format('Скорость: {0}', MainTimer.Interval);
  GameSpeedLabel2.Text := string.Format('Скорость: {0}', MainTimer.Interval);
end;

procedure MainForm.GameSpeed2_Scroll(sender: Object; e: EventArgs);
begin
  MainTimer.Interval := GameSpeed2.Value;
  MoveTimer.Interval := Round(GameSpeed2.Value/3);
  
  BoostSpeed1.Value := MoveTimer.Interval;
  BoostSpeed2.Value := MoveTimer.Interval;
  
  BoostSpeedLabel1.Text := string.Format('Скорость при ускорении: {0}', MoveTimer.Interval);
  BoostSpeedLabel2.Text := string.Format('Скорость при ускорении: {0}', MoveTimer.Interval);
  
  GameSpeed1.Value := GameSpeed2.Value;
  
  GameSpeedLabel1.Text := string.Format('Обычная скорость: {0}', MainTimer.Interval);
  GameSpeedLabel2.Text := string.Format('Обычная скорость: {0}', MainTimer.Interval);
end;

procedure restart();
begin
  score := 0;
  gameOver := false;
  figures := Arr(new Figure(0))[:-1];
  nextFigure    := new Figure(PABCSystem.Random(1,7));
  currentFigure := new Figure(PABCSystem.Random(1,7));
end;

procedure MainForm.RestartButton_Click(sender: Object; e: EventArgs);
begin
  restart();
  draw();
  GamePictureBox.Invalidate;
  drawNextFigure();
  NextFigurePictureBox.Invalidate;
  MainTimer.Enabled := true;
  MoveTimer.Enabled := true;
  GameOverPanel.Visible := false;
  PauseButton.Text := 'Пауза';
  ScoreLabel.Text := string.Format('Счёт: {0}',score);
  
  RestartButton.SetStyle(ControlStyles.Selectable, false);
  GiveUpButton.SetStyle(ControlStyles.Selectable, false);
  PauseButton.SetStyle(ControlStyles.Selectable, false);
end;

procedure MainForm.PauseButton_Click(sender: Object; e: EventArgs);
begin
  if PauseButton.Text = 'Пауза' then begin
    MainTimer.Enabled := false;
    MoveTimer.Enabled := false;
    PauseButton.Text := 'Продолжить';
    pause := true;
  end
  else begin
    MainTimer.Enabled := true;
    MoveTimer.Enabled := true;
    PauseButton.Text := 'Пауза';
    pause := false;
  end;
  RestartButton.SetStyle(ControlStyles.Selectable, false);
  GiveUpButton.SetStyle(ControlStyles.Selectable, false);
  PauseButton.SetStyle(ControlStyles.Selectable, false);
end;

procedure MainForm.BoostSpeed1_Scroll(sender: Object; e: EventArgs);
begin
  MoveTimer.Interval := BoostSpeed1.Value;
  
  BoostSpeed2.Value := BoostSpeed1.Value;
  
  BoostSpeedLabel1.Text := string.Format('Скорость при ускорении: {0}', MoveTimer.Interval);
  BoostSpeedLabel2.Text := string.Format('Скорость при ускорении: {0}', MoveTimer.Interval);
end;

procedure MainForm.BoostSpeed2_Scroll(sender: Object; e: EventArgs);
begin
  MoveTimer.Interval := BoostSpeed2.Value;
  
  BoostSpeed1.Value := BoostSpeed2.Value;
  
  BoostSpeedLabel1.Text := string.Format('Скорость при ускорении: {0}', MoveTimer.Interval);
  BoostSpeedLabel2.Text := string.Format('Скорость при ускорении: {0}', MoveTimer.Interval);
end;

procedure MainForm.GiveUpButton_Click(sender: Object; e: EventArgs);
begin
  gameOver := true;
  GiveUpButton.SetStyle(ControlStyles.Selectable, false);
end;

end.
