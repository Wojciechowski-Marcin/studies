#pragma once

#include "material.hpp"
#include "tribe.hpp"
#include <memory>
#include <vector>

class GameManager {
public:
  void init(int height, int width);
  static std::vector<std::shared_ptr<Tribe>> tribes;
  static std::vector<std::shared_ptr<Material>> materials;
  static bool isFieldTaken(int y, int x);
  void generateTribes(int height, int width);
  void generateMaterials(int height, int width, int amount);
  void draw();
  void pickArmyTargets();
  static std::shared_ptr<Material> findClosestMaterial(int y, int x);
  static std::shared_ptr<Material> getRandomMaterial();
  static bool isGameOver;

private:
};