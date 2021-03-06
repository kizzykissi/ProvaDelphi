// Uncomment the following directive to create a console application
// or leave commented to create a GUI application... 
// {$APPTYPE CONSOLE}

program ProvaDelphiAppTests;

uses
  TestFramework {$IFDEF LINUX},
  QForms,
  QGUITestRunner {$ELSE},
  Forms,
  GUITestRunner {$ENDIF},
  TextTestRunner,
  uspControllerProjetosTests in 'uspControllerProjetosTests.pas',
  uspControllerProjetos in '..\Fontes\uspControllerProjetos.pas',
  uspQueryTests in 'uspQueryTests.pas',
  uspQuery in '..\Fontes\uspQuery.pas',
  uspThreadTests in 'uspThreadTests.pas',
  uspThread in '..\Fontes\uspThread.pas';

{$R *.RES}

begin
  Application.Initialize;

{$IFDEF LINUX}
  QGUITestRunner.RunRegisteredTests;
{$ELSE}
  if System.IsConsole then
    TextTestRunner.RunRegisteredTests
  else
    GUITestRunner.RunRegisteredTests;
{$ENDIF}

end.

 