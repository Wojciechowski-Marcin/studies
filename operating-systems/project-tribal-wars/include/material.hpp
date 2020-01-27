#pragma once

#include <memory>
#include <vector>

class Material {
public:
  Material() = default;
  Material(int y, int x) : positionY(y), positionX(x){};
  int positionY;
  int positionX;
  void draw();
  int diggerColor;
  bool isBeingDigged = false;
  int diggingProgress = 0;

private:
};