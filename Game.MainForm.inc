procedure InitializeComponent;
    begin
        self.components := new System.ComponentModel.Container();
        var resources: System.ComponentModel.ComponentResourceManager := new System.ComponentModel.ComponentResourceManager(typeof(MainForm));
        self.GamePictureBox := new System.Windows.Forms.PictureBox();
        self.NextFigurePictureBox := new System.Windows.Forms.PictureBox();
        self.ScoreLabel := new System.Windows.Forms.Label();
        self.RestartButton := new System.Windows.Forms.Button();
        self.MoveTimer := new System.Windows.Forms.Timer(self.components);
        self.GameOverPanel := new System.Windows.Forms.Panel();
        self.GameOverCloseButton := new System.Windows.Forms.Button();
        self.ResultScoreLabel := new System.Windows.Forms.Label();
        self.BoostSpeedLabel1 := new System.Windows.Forms.Label();
        self.BoostSpeed1 := new System.Windows.Forms.TrackBar();
        self.GameOverPanelRestartButton := new System.Windows.Forms.Button();
        self.GameSpeedLabel1 := new System.Windows.Forms.Label();
        self.GameSpeed1 := new System.Windows.Forms.TrackBar();
        self.label2 := new System.Windows.Forms.Label();
        self.MainTimer := new System.Windows.Forms.Timer(self.components);
        self.StartPanel := new System.Windows.Forms.Panel();
        self.BoostSpeedLabel2 := new System.Windows.Forms.Label();
        self.BoostSpeed2 := new System.Windows.Forms.TrackBar();
        self.GameSpeedLabel2 := new System.Windows.Forms.Label();
        self.label1 := new System.Windows.Forms.Label();
        self.GameSpeed2 := new System.Windows.Forms.TrackBar();
        self.ExitButton := new System.Windows.Forms.Button();
        self.StartButton := new System.Windows.Forms.Button();
        self.PauseButton := new System.Windows.Forms.Button();
        self.GiveUpButton := new System.Windows.Forms.Button();
        (System.ComponentModel.ISupportInitialize(self.GamePictureBox)).BeginInit();
        (System.ComponentModel.ISupportInitialize(self.NextFigurePictureBox)).BeginInit();
        self.GameOverPanel.SuspendLayout();
        (System.ComponentModel.ISupportInitialize(self.BoostSpeed1)).BeginInit();
        (System.ComponentModel.ISupportInitialize(self.GameSpeed1)).BeginInit();
        self.StartPanel.SuspendLayout();
        (System.ComponentModel.ISupportInitialize(self.BoostSpeed2)).BeginInit();
        (System.ComponentModel.ISupportInitialize(self.GameSpeed2)).BeginInit();
        self.SuspendLayout();
        // 
        // GamePictureBox
        // 
        self.GamePictureBox.BackColor := System.Drawing.SystemColors.ControlLightLight;
        self.GamePictureBox.BorderStyle := System.Windows.Forms.BorderStyle.FixedSingle;
        self.GamePictureBox.Location := new System.Drawing.Point(12, 55);
        self.GamePictureBox.Name := 'GamePictureBox';
        self.GamePictureBox.Size := new System.Drawing.Size(303, 603);
        self.GamePictureBox.TabIndex := 3;
        self.GamePictureBox.TabStop := false;
        // 
        // NextFigurePictureBox
        // 
        self.NextFigurePictureBox.BackColor := System.Drawing.SystemColors.ControlLightLight;
        self.NextFigurePictureBox.BorderStyle := System.Windows.Forms.BorderStyle.FixedSingle;
        self.NextFigurePictureBox.Location := new System.Drawing.Point(321, 55);
        self.NextFigurePictureBox.Name := 'NextFigurePictureBox';
        self.NextFigurePictureBox.Size := new System.Drawing.Size(153, 153);
        self.NextFigurePictureBox.TabIndex := 4;
        self.NextFigurePictureBox.TabStop := false;
        // 
        // ScoreLabel
        // 
        self.ScoreLabel.Font := new System.Drawing.Font('Microsoft Sans Serif', 20.25, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, (System.Byte(204)));
        self.ScoreLabel.Location := new System.Drawing.Point(321, 12);
        self.ScoreLabel.Name := 'ScoreLabel';
        self.ScoreLabel.Size := new System.Drawing.Size(150, 40);
        self.ScoreLabel.TabIndex := 5;
        self.ScoreLabel.Text := 'Счёт: 0';
        self.ScoreLabel.TextAlign := System.Drawing.ContentAlignment.MiddleCenter;
        // 
        // RestartButton
        // 
        self.RestartButton.Font := new System.Drawing.Font('Microsoft Sans Serif', 12, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, (System.Byte(204)));
        self.RestartButton.Location := new System.Drawing.Point(321, 215);
        self.RestartButton.Name := 'RestartButton';
        self.RestartButton.Size := new System.Drawing.Size(153, 40);
        self.RestartButton.TabIndex := 7;
        self.RestartButton.TabStop := false;
        self.RestartButton.Text := 'Рестарт';
        self.RestartButton.UseVisualStyleBackColor := true;
        self.RestartButton.Click += RestartButton_Click;
        // 
        // MoveTimer
        // 
        self.MoveTimer.Tick += MoveTimer_Tick;
        // 
        // GameOverPanel
        // 
        self.GameOverPanel.Controls.Add(self.GameOverCloseButton);
        self.GameOverPanel.Controls.Add(self.ResultScoreLabel);
        self.GameOverPanel.Controls.Add(self.BoostSpeedLabel1);
        self.GameOverPanel.Controls.Add(self.BoostSpeed1);
        self.GameOverPanel.Controls.Add(self.GameOverPanelRestartButton);
        self.GameOverPanel.Controls.Add(self.GameSpeedLabel1);
        self.GameOverPanel.Controls.Add(self.GameSpeed1);
        self.GameOverPanel.Controls.Add(self.label2);
        self.GameOverPanel.Location := new System.Drawing.Point(12, 12);
        self.GameOverPanel.Name := 'GameOverPanel';
        self.GameOverPanel.Size := new System.Drawing.Size(463, 646);
        self.GameOverPanel.TabIndex := 8;
        self.GameOverPanel.Visible := false;
        // 
        // GameOverCloseButton
        // 
        self.GameOverCloseButton.Font := new System.Drawing.Font('Microsoft Sans Serif', 12, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, (System.Byte(204)));
        self.GameOverCloseButton.Location := new System.Drawing.Point(106, 439);
        self.GameOverCloseButton.Name := 'GameOverCloseButton';
        self.GameOverCloseButton.Size := new System.Drawing.Size(250, 50);
        self.GameOverCloseButton.TabIndex := 16;
        self.GameOverCloseButton.TabStop := false;
        self.GameOverCloseButton.Text := 'Выход';
        self.GameOverCloseButton.UseVisualStyleBackColor := true;
        self.GameOverCloseButton.Click += ExitButton_Click;
        // 
        // ResultScoreLabel
        // 
        self.ResultScoreLabel.Font := new System.Drawing.Font('Microsoft Sans Serif', 18, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, (System.Byte(204)));
        self.ResultScoreLabel.Location := new System.Drawing.Point(4, 72);
        self.ResultScoreLabel.Name := 'ResultScoreLabel';
        self.ResultScoreLabel.Size := new System.Drawing.Size(455, 32);
        self.ResultScoreLabel.TabIndex := 15;
        self.ResultScoreLabel.Text := 'Итоговый счёт: 0';
        self.ResultScoreLabel.TextAlign := System.Drawing.ContentAlignment.TopCenter;
        // 
        // BoostSpeedLabel1
        // 
        self.BoostSpeedLabel1.Font := new System.Drawing.Font('Microsoft Sans Serif', 9.75, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, (System.Byte(204)));
        self.BoostSpeedLabel1.Location := new System.Drawing.Point(106, 314);
        self.BoostSpeedLabel1.Name := 'BoostSpeedLabel1';
        self.BoostSpeedLabel1.Size := new System.Drawing.Size(243, 23);
        self.BoostSpeedLabel1.TabIndex := 14;
        self.BoostSpeedLabel1.Text := 'Скорость при ускорении: 100';
        self.BoostSpeedLabel1.TextAlign := System.Drawing.ContentAlignment.TopCenter;
        // 
        // BoostSpeed1
        // 
        self.BoostSpeed1.LargeChange := 100;
        self.BoostSpeed1.Location := new System.Drawing.Point(106, 292);
        self.BoostSpeed1.Maximum := 1000;
        self.BoostSpeed1.Minimum := 10;
        self.BoostSpeed1.Name := 'BoostSpeed1';
        self.BoostSpeed1.Size := new System.Drawing.Size(243, 45);
        self.BoostSpeed1.SmallChange := 100;
        self.BoostSpeed1.TabIndex := 13;
        self.BoostSpeed1.TabStop := false;
        self.BoostSpeed1.Value := 100;
        self.BoostSpeed1.Scroll += BoostSpeed1_Scroll;
        // 
        // GameOverPanelRestartButton
        // 
        self.GameOverPanelRestartButton.Font := new System.Drawing.Font('Microsoft Sans Serif', 12, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, (System.Byte(204)));
        self.GameOverPanelRestartButton.Location := new System.Drawing.Point(106, 365);
        self.GameOverPanelRestartButton.Name := 'GameOverPanelRestartButton';
        self.GameOverPanelRestartButton.Size := new System.Drawing.Size(250, 50);
        self.GameOverPanelRestartButton.TabIndex := 12;
        self.GameOverPanelRestartButton.Text := 'Рестарт';
        self.GameOverPanelRestartButton.UseVisualStyleBackColor := true;
        self.GameOverPanelRestartButton.Click += RestartButton_Click;
        // 
        // GameSpeedLabel1
        // 
        self.GameSpeedLabel1.Font := new System.Drawing.Font('Microsoft Sans Serif', 9.75, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, (System.Byte(204)));
        self.GameSpeedLabel1.Location := new System.Drawing.Point(106, 251);
        self.GameSpeedLabel1.Name := 'GameSpeedLabel1';
        self.GameSpeedLabel1.Size := new System.Drawing.Size(243, 23);
        self.GameSpeedLabel1.TabIndex := 11;
        self.GameSpeedLabel1.Text := 'Обычная скорость: 300';
        self.GameSpeedLabel1.TextAlign := System.Drawing.ContentAlignment.TopCenter;
        // 
        // GameSpeed1
        // 
        self.GameSpeed1.LargeChange := 100;
        self.GameSpeed1.Location := new System.Drawing.Point(106, 229);
        self.GameSpeed1.Maximum := 1000;
        self.GameSpeed1.Minimum := 100;
        self.GameSpeed1.Name := 'GameSpeed1';
        self.GameSpeed1.Size := new System.Drawing.Size(243, 45);
        self.GameSpeed1.SmallChange := 100;
        self.GameSpeed1.TabIndex := 10;
        self.GameSpeed1.TabStop := false;
        self.GameSpeed1.Value := 300;
        self.GameSpeed1.Scroll += GameSpeed1_Scroll;
        // 
        // label2
        // 
        self.label2.Font := new System.Drawing.Font('Microsoft Sans Serif', 26.25, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, (System.Byte(204)));
        self.label2.Location := new System.Drawing.Point(3, 3);
        self.label2.Name := 'label2';
        self.label2.Size := new System.Drawing.Size(456, 65);
        self.label2.TabIndex := 0;
        self.label2.Text := 'Вы проиграли';
        self.label2.TextAlign := System.Drawing.ContentAlignment.MiddleCenter;
        // 
        // MainTimer
        // 
        self.MainTimer.Interval := 300;
        self.MainTimer.Tick += MainTimer_Tick;
        // 
        // StartPanel
        // 
        self.StartPanel.Controls.Add(self.BoostSpeedLabel2);
        self.StartPanel.Controls.Add(self.BoostSpeed2);
        self.StartPanel.Controls.Add(self.GameSpeedLabel2);
        self.StartPanel.Controls.Add(self.label1);
        self.StartPanel.Controls.Add(self.GameSpeed2);
        self.StartPanel.Controls.Add(self.ExitButton);
        self.StartPanel.Controls.Add(self.StartButton);
        self.StartPanel.Location := new System.Drawing.Point(12, 12);
        self.StartPanel.Name := 'StartPanel';
        self.StartPanel.Size := new System.Drawing.Size(463, 646);
        self.StartPanel.TabIndex := 9;
        // 
        // BoostSpeedLabel2
        // 
        self.BoostSpeedLabel2.Font := new System.Drawing.Font('Microsoft Sans Serif', 9.75, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, (System.Byte(204)));
        self.BoostSpeedLabel2.Location := new System.Drawing.Point(106, 270);
        self.BoostSpeedLabel2.Name := 'BoostSpeedLabel2';
        self.BoostSpeedLabel2.Size := new System.Drawing.Size(250, 23);
        self.BoostSpeedLabel2.TabIndex := 16;
        self.BoostSpeedLabel2.Text := 'Скорость при ускорении: 100';
        self.BoostSpeedLabel2.TextAlign := System.Drawing.ContentAlignment.TopCenter;
        // 
        // BoostSpeed2
        // 
        self.BoostSpeed2.LargeChange := 100;
        self.BoostSpeed2.Location := new System.Drawing.Point(106, 248);
        self.BoostSpeed2.Maximum := 1000;
        self.BoostSpeed2.Minimum := 10;
        self.BoostSpeed2.Name := 'BoostSpeed2';
        self.BoostSpeed2.Size := new System.Drawing.Size(250, 45);
        self.BoostSpeed2.SmallChange := 100;
        self.BoostSpeed2.TabIndex := 15;
        self.BoostSpeed2.TabStop := false;
        self.BoostSpeed2.Value := 100;
        self.BoostSpeed2.Scroll += BoostSpeed2_Scroll;
        // 
        // GameSpeedLabel2
        // 
        self.GameSpeedLabel2.Font := new System.Drawing.Font('Microsoft Sans Serif', 9.75, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, (System.Byte(204)));
        self.GameSpeedLabel2.Location := new System.Drawing.Point(106, 208);
        self.GameSpeedLabel2.Name := 'GameSpeedLabel2';
        self.GameSpeedLabel2.Size := new System.Drawing.Size(250, 23);
        self.GameSpeedLabel2.TabIndex := 14;
        self.GameSpeedLabel2.Text := 'Обычная скорость: 300';
        self.GameSpeedLabel2.TextAlign := System.Drawing.ContentAlignment.TopCenter;
        // 
        // label1
        // 
        self.label1.Font := new System.Drawing.Font('Microsoft Sans Serif', 36, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, (System.Byte(204)));
        self.label1.Location := new System.Drawing.Point(3, 3);
        self.label1.Name := 'label1';
        self.label1.Size := new System.Drawing.Size(456, 76);
        self.label1.TabIndex := 2;
        self.label1.Text := 'Тетрис';
        self.label1.TextAlign := System.Drawing.ContentAlignment.MiddleCenter;
        // 
        // GameSpeed2
        // 
        self.GameSpeed2.LargeChange := 100;
        self.GameSpeed2.Location := new System.Drawing.Point(106, 186);
        self.GameSpeed2.Maximum := 1000;
        self.GameSpeed2.Minimum := 100;
        self.GameSpeed2.Name := 'GameSpeed2';
        self.GameSpeed2.Size := new System.Drawing.Size(250, 45);
        self.GameSpeed2.SmallChange := 100;
        self.GameSpeed2.TabIndex := 13;
        self.GameSpeed2.TabStop := false;
        self.GameSpeed2.Value := 300;
        self.GameSpeed2.Scroll += GameSpeed2_Scroll;
        // 
        // ExitButton
        // 
        self.ExitButton.Font := new System.Drawing.Font('Microsoft Sans Serif', 12, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, (System.Byte(204)));
        self.ExitButton.Location := new System.Drawing.Point(106, 411);
        self.ExitButton.Name := 'ExitButton';
        self.ExitButton.Size := new System.Drawing.Size(250, 50);
        self.ExitButton.TabIndex := 1;
        self.ExitButton.TabStop := false;
        self.ExitButton.Text := 'Выход';
        self.ExitButton.UseVisualStyleBackColor := true;
        self.ExitButton.Click += ExitButton_Click;
        // 
        // StartButton
        // 
        self.StartButton.Font := new System.Drawing.Font('Microsoft Sans Serif', 12, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, (System.Byte(204)));
        self.StartButton.Location := new System.Drawing.Point(106, 337);
        self.StartButton.Name := 'StartButton';
        self.StartButton.Size := new System.Drawing.Size(250, 50);
        self.StartButton.TabIndex := 0;
        self.StartButton.TabStop := false;
        self.StartButton.Text := 'Старт';
        self.StartButton.UseVisualStyleBackColor := true;
        self.StartButton.Click += StartButton_Click;
        // 
        // PauseButton
        // 
        self.PauseButton.Font := new System.Drawing.Font('Microsoft Sans Serif', 12, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, (System.Byte(204)));
        self.PauseButton.Location := new System.Drawing.Point(325, 307);
        self.PauseButton.Name := 'PauseButton';
        self.PauseButton.Size := new System.Drawing.Size(150, 40);
        self.PauseButton.TabIndex := 10;
        self.PauseButton.TabStop := false;
        self.PauseButton.Text := 'Пауза';
        self.PauseButton.UseVisualStyleBackColor := true;
        self.PauseButton.Click += PauseButton_Click;
        // 
        // GiveUpButton
        // 
        self.GiveUpButton.Font := new System.Drawing.Font('Microsoft Sans Serif', 12, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, (System.Byte(204)));
        self.GiveUpButton.Location := new System.Drawing.Point(324, 261);
        self.GiveUpButton.Name := 'GiveUpButton';
        self.GiveUpButton.Size := new System.Drawing.Size(150, 40);
        self.GiveUpButton.TabIndex := 11;
        self.GiveUpButton.TabStop := false;
        self.GiveUpButton.Text := 'Сдаться';
        self.GiveUpButton.UseVisualStyleBackColor := true;
        self.GiveUpButton.Click += GiveUpButton_Click;
        // 
        // MainForm
        // 
        self.BackColor := System.Drawing.Color.White;
        self.ClientSize := new System.Drawing.Size(487, 670);
        self.Controls.Add(self.StartPanel);
        self.Controls.Add(self.GameOverPanel);
        self.Controls.Add(self.RestartButton);
        self.Controls.Add(self.ScoreLabel);
        self.Controls.Add(self.NextFigurePictureBox);
        self.Controls.Add(self.GamePictureBox);
        self.Controls.Add(self.PauseButton);
        self.Controls.Add(self.GiveUpButton);
        self.FormBorderStyle := System.Windows.Forms.FormBorderStyle.FixedDialog;
        self.Icon := (System.Drawing.Icon(resources.GetObject('$this.Icon')));
        self.KeyPreview := true;
        self.MaximizeBox := false;
        self.Name := 'MainForm';
        self.StartPosition := System.Windows.Forms.FormStartPosition.CenterScreen;
        self.Text := 'Тетрис';
        self.Load += Form1_Load;
        self.KeyDown += Form1_KeyDown;
        self.KeyUp += Form1_KeyUp;
        (System.ComponentModel.ISupportInitialize(self.GamePictureBox)).EndInit();
        (System.ComponentModel.ISupportInitialize(self.NextFigurePictureBox)).EndInit();
        self.GameOverPanel.ResumeLayout(false);
        self.GameOverPanel.PerformLayout();
        (System.ComponentModel.ISupportInitialize(self.BoostSpeed1)).EndInit();
        (System.ComponentModel.ISupportInitialize(self.GameSpeed1)).EndInit();
        self.StartPanel.ResumeLayout(false);
        self.StartPanel.PerformLayout();
        (System.ComponentModel.ISupportInitialize(self.BoostSpeed2)).EndInit();
        (System.ComponentModel.ISupportInitialize(self.GameSpeed2)).EndInit();
        self.ResumeLayout(false);
    end;
