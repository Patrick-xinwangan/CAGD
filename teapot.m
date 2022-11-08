%% Displaying Complex Three-Dimensional Objects
% This example shows how to create and display a complex three dimensional
% object and control its appearance.
 
%   Copyright 2014 The MathWorks, Inc.
 
%% Get Geometry of Object
% This example uses a graphics object called the Newell teapot.  The
% vertex, face, and color index data for the teapot are calculated by the
% |teapotData| function. Since the teapot is a complex geometric shape,
% there are a large number of vertices (4608) and faces (3872) returned by
% the function.
 %  获取对象的几何
% 本示例使用一个称为Newell茶壶的图形对象。通过teapotData函数，可以计算茶壶的顶点，
% 面和颜色索引数据。由于茶壶是复杂的几何形状，因此该函数返回了大量的顶点（4608）
% 和面（3872）。

[verts, faces, cindex] = teapotGeometry;
 
%% Create Teapot Patch Object
% Using the geometry data, draw the teapot using the |patch| command.  The
% |patch| command creates a patch object.
% 创建茶壶贴片对象
% 使用几何数据，使用patch命令绘制茶壶。该patch命令创建一个贴片对象。

figure
p = patch('Faces',faces,'Vertices',verts,'FaceVertexCData',cindex,'FaceColor','interp')
%%
% Use the |view| command to change the orientation of the object.
%  使用view命令更改对象的方向。

view(-151,30)     % change the orientation
axis equal off    % make the axes equal and invisible
 
%% Adjust Transparency
% Make the object transparent using the |FaceAlpha| property of the patch
% object.
%  调整透明度
% 调整FaceAlpha补丁对象的属性，改变对象透明度。

p.FaceAlpha = 0.3;   % make the object semi-transparent
 
%% 
% If the |FaceColor| property is set to 'none', then the object appears as
% a wire frame diagram.
%  如果该FaceColor属性设置为“ none”，则该对象显示为线框形状。

p.FaceColor = 'none';    % turn off the colors
 
%% Change Colormap
% Change the colors for the object using the |colormap| function.
% 更改颜色模板
% 使用colormap函数更改对象的颜色。 

p.FaceAlpha = 1;           % remove the transparency
p.FaceColor = 'interp';    % set the face colors to be interpolated
p.LineStyle = 'none';      % remove the lines
colormap(copper)           % change the colormap
 
%% Light the Object
% Add a light to make the object appear more realistic.
%  为物体设置光线
% 添加灯光以使对象看起来更逼真。

l = light('Position',[-0.4 0.2 0.9],'Style','infinite')
lighting gouraud
 
%%
% These properties of the patch object affect the strength of the light and
% the refective properties of the object:
%
% * |AmbientStrength| - controls the strength of ambient light
% * |DiffuseStrength| - controls the strength of diffuse light
% * |SpecularStrength| - controls the strength of reflected light
% * |SpecularExponent| - controls the harshness of reflected light
% * |SpecularColorReflectance| - controls how refected color is calculated.
%
% You can set these properties individually. To set these properties to a
% predetermined set of values that approximate the appearance of metal,
% shiny, or dull material, use the |material| command.

% 贴片对象的这些属性影响光的强度和对象的反射属性：
% 
% AmbientStrength -控制环境光的强度
% DiffuseStrength -控制散射光的强度
% SpecularStrength -控制反射光的强度
% SpecularExponent -控制反射光的粗糙度
% SpecularColorReflectance -控制如何计算反射色。
% 我们可以单独设置这些属性。要将这些属性设置为一组预定值，这些值近似于金属，光泽或暗淡材料的外观，请使用material命令。

material shiny
 
%%
% Adjust the position of the light using its |Position| property.  The
% position is in _x_, _y_, _z_ coordinates.
%  使用Position属性调整光源的位置。该位置在x，y和z坐标中。
 
l.Position = [-0.1 0.6 0.8]