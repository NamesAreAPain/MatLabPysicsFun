%% ForcesSimulationGUI
%%
function varargout = ForcesSimulationGUI(varargin)
% FORCESSIMULATIONGUI MATLAB code for ForcesSimulationGUI.fig
%      FORCESSIMULATIONGUI, by itself, creates a new FORCESSIMULATIONGUI or raises the existing
%      singleton*.
%
%      H = FORCESSIMULATIONGUI returns the handle to a new FORCESSIMULATIONGUI or the handle to
%      the existing singleton*.
%
%      FORCESSIMULATIONGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FORCESSIMULATIONGUI.M with the given input arguments.
%
%      FORCESSIMULATIONGUI('Property','Value',...) creates a new FORCESSIMULATIONGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before ForcesSimulationGUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to ForcesSimulationGUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help ForcesSimulationGUI

% Last Modified by GUIDE v2.5 23-Mar-2017 22:15:15

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @ForcesSimulationGUI_OpeningFcn, ...
                   'gui_OutputFcn',  @ForcesSimulationGUI_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before ForcesSimulationGUI is made visible.
function ForcesSimulationGUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to ForcesSimulationGUI (see VARARGIN)


% Choose default command line output for ForcesSimulationGUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes ForcesSimulationGUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);

global axisplot;
axisplot = handles.simulation;
axes(axisplot);
axis equal;

% --- Outputs from this function are returned to the command line.
function varargout = ForcesSimulationGUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



% --- Executes on selection change in listbox1.
function listbox1_Callback(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox1


% --- Executes during object creation, after setting all properties.
function listbox1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function title_CreateFcn(hObject, eventdata, handles)
% hObject    handle to title (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function position_CreateFcn(hObject, eventdata, handles)
% hObject    handle to position (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object deletion, before destroying properties.
function simulation_DeleteFcn(hObject, eventdata, handles)
% hObject    handle to simulation (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in Startbutton.
function Startbutton_Callback(hObject, eventdata, handles)
% hObject    handle to Startbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Startbutton
handles.simulation;
global ENDING; 
ENDING = 0;
mass = [str2num(get(handles.massobject1,'String')),str2num(get(handles.massobj2,'String'))];
velocity = [str2num(get(handles.velocityobj1,'String'));str2num(get(handles.velocityobj1,'String'))]; 
location = [str2num(get(handles.Positionobj1,'String'));str2num(get(handles.Positionobj2,'String'))];


%create the structures to plot 

Networks = pointsnet(mass,velocity,location);
for P = 1:length(Networks)
    Networks(P) = setUpNetwork(Networks(P));
end

cla

createshapes(Networks);
pause(2);
Networks = simulate(Networks,{},{},0.01,10,{});
disp('simulation complete');
cla

createshapes(Networks);



% --- Executes on button press in Pausebutton.
function Pausebutton_Callback(hObject, eventdata, handles)
% hObject    handle to Pausebutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Pausebutton
global ENDING
Pauseb = get(handles.Pausebutton,'Value');
Pauseb = ENDING;
ENDING = 1;



% --- Executes on selection change in simulationsetups.
function simulationsetups_Callback(hObject, eventdata, handles)
% hObject    handle to simulationsetups (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns simulationsetups contents as cell array
%        contents{get(hObject,'Value')} returns selected item from simulationsetups


% --- Executes during object creation, after setting all properties.
function simulationsetups_CreateFcn(hObject, eventdata, handles)
% hObject    handle to simulationsetups (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function simulation_CreateFcn(hObject, eventdata, handles)
% hObject    handle to simulation (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate simulation


% --- Executes on key press with focus on Startbutton and none of its controls.
function Startbutton_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to Startbutton (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)



function massobject1_Callback(hObject, eventdata, handles)
% hObject    handle to massobject1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of massobject1 as text
%        str2double(get(hObject,'String')) returns contents of massobject1 as a double


% --- Executes during object creation, after setting all properties.
function massobject1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to massobject1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function velocityobj1_Callback(hObject, eventdata, handles)
% hObject    handle to velocityobj1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of velocityobj1 as text
%        str2double(get(hObject,'String')) returns contents of velocityobj1 as a double


% --- Executes during object creation, after setting all properties.
function velocityobj1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to velocityobj1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Positionobj1_Callback(hObject, eventdata, handles)
% hObject    handle to Positionobj1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Positionobj1 as text
%        str2double(get(hObject,'String')) returns contents of Positionobj1 as a double

% Positionobj1 = str2num(get(handles.Positionobj1,'String'));
% disp(Positionobj1)

% --- Executes during object creation, after setting all properties.
function Positionobj1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Positionobj1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function massobj2_Callback(hObject, eventdata, handles)
% hObject    handle to massobj2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of massobj2 as text
%        str2double(get(hObject,'String')) returns contents of massobj2 as a double


% --- Executes during object creation, after setting all properties.
function massobj2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to massobj2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function velocityobj2_Callback(hObject, eventdata, handles)
% hObject    handle to velocityobj2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of velocityobj2 as text
%        str2double(get(hObject,'String')) returns contents of velocityobj2 as a double


% --- Executes during object creation, after setting all properties.
function velocityobj2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to velocityobj2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit16_Callback(hObject, eventdata, handles)
% hObject    handle to positionobj2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of positionobj2 as text
%        str2double(get(hObject,'String')) returns contents of positionobj2 as a double


% --- Executes during object creation, after setting all properties.
function positionobj2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to positionobj2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Positionobj2_Callback(hObject, eventdata, handles)
% hObject    handle to Positionobj2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Positionobj2 as text
%        str2double(get(hObject,'String')) returns contents of Positionobj2 as a double


% --- Executes during object creation, after setting all properties.
function Positionobj2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Positionobj2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement.
function speedslider_Callback(hObject, eventdata, handles)
% hObject    handle to speedslider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function speedslider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to speedslider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
