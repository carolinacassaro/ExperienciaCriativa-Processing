from PIL import Image
import numpy as np

# Create an image with transparent background
size = 400
# Generate a sphere using numpy
x = np.linspace(-1, 1, size)
y = np.linspace(-1, 1, size)
X, Y = np.meshgrid(x, y)
R = np.sqrt(X**2 + Y**2)

light_X = -0.4
light_Y = -0.4

Z = np.sqrt(np.maximum(1 - R**2, 0))

# Light vector
L = np.array([-light_X, -light_Y, 1.0])
L = L / np.linalg.norm(L)

# Dot product for diffuse lighting
intensity = (X * L[0] + Y * L[1] + Z * L[2])
intensity = np.maximum(intensity, 0)

# Ambient light + diffuse
shade = 0.4 + 0.6 * intensity

# Apply mask (anti-aliased edge)
edge_width = 0.01
mask_alpha = np.clip((1.0 - R) / edge_width, 0, 1)

# Base color for the sphere (matching the P3D code color: 200, 220, 240)
r, g, b = 200, 220, 240

R_arr = np.clip(r * shade, 0, 255).astype(np.uint8)
G_arr = np.clip(g * shade, 0, 255).astype(np.uint8)
B_arr = np.clip(b * shade, 0, 255).astype(np.uint8)
A_arr = (mask_alpha * 255).astype(np.uint8)

result = np.stack([R_arr, G_arr, B_arr, A_arr], axis=-1)
img_result = Image.fromarray(result, 'RGBA')
img_result.save('esfera.png')
print("esfera.png created successfully.")
