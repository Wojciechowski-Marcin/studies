#include "gameManager.hpp"
#include "constants.hpp"
#include "utils.hpp"
#include <math.h>
#include <memory>

std::vector<std::shared_ptr<Tribe>> GameManager::tribes;
std::vector<std::shared_ptr<Material>> GameManager::materials;
bool GameManager::isGameOver = false;

void GameManager::init(int height, int width) {
  generateMaterials(height, width, Constants::RESOURCE_NUMBER);
  generateTribes(height, width);
  pickArmyTargets();
}

void GameManager::generateTribes(int height, int width) {
  tribes.push_back(std::make_shared<Tribe>(height / 4, width / 4, 1));
  tribes.push_back(std::make_shared<Tribe>(height / 4, width * 3 / 4, 2));
  tribes.push_back(std::make_shared<Tribe>(height * 3 / 4, width * 3 / 4, 3));
  tribes.push_back(std::make_shared<Tribe>(height * 3 / 4, width / 4, 4));
}

void GameManager::generateMaterials(int height, int width, int amount) {
  for (int i = 0; i < amount; i++) {
    int y = 0;
    int x = 0;
    do {
      y = utils::generateRandomNumber(2, height - 2);
      x = utils::generateRandomNumber(2, width - 2);
    } while (isFieldTaken(y, x));
    materials.push_back(std::make_shared<Material>(y, x));
  }
}

void GameManager::draw() {
  for (auto &material : materials) {
    material->draw();
  }
  for (auto &tribe : tribes) {
    tribe->draw();
  }
}

bool GameManager::isFieldTaken(int y, int x) {
  for (auto &tribe : tribes) {
    for (auto &village : tribe->villages) {
      if (y <= village->positionY + 3 && y >= village->positionY - 3 &&
          x <= village->positionX + 4 && x >= village->positionX - 4) {
        return true;
      }
    }
  }
  for (auto &material : materials) {
    if (y <= material->positionY + 3 && y >= material->positionY - 3 &&
        x <= material->positionX + 4 && x >= material->positionX - 4) {
      return true;
    }
  }
  return false;
}

void GameManager::pickArmyTargets() {
  for (auto &tribe : tribes)
    for (auto &village : tribe->villages)
      village->army->pickTarget();
}

std::shared_ptr<Material> GameManager::findClosestMaterial(int y, int x) {
  int closestDist = __INT_MAX__;
  std::shared_ptr<Material> closestMaterial = materials[0];
  for (auto &material : materials) {
    int distance = abs(material->positionX - x) + abs(material->positionY - y);
    if (closestDist > distance) {
      closestDist = distance;
      closestMaterial = material;
    }
  }
  return closestMaterial;
}

std::shared_ptr<Material> GameManager::getRandomMaterial() {
  int index = utils::generateRandomNumber(0, materials.size() - 1);
  return materials[index];
}