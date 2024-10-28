import cv2
import gxipy as gx
import numpy as np

# Инициализация камеры
device_manager = gx.DeviceManager()
cam = device_manager.open_device_by_index(1)

# Настройка параметров камеры
cam.ExposureTime.set(100000.0)
cam.stream_on()

try:
    raw_image = cam.data_stream[0].get_image()
    if raw_image is None:
        print("OMG!")
        exit()
    rgb_image = raw_image.convert("RGB")
    np_image = rgb_image.get_numpy_array()
    
    # Преобразование в градации серого
    gray = cv2.cvtColor(np_image, cv2.COLOR_RGB2GRAY)
    # Повышение контраста
    gray = cv2.equalizeHist(gray)
    gray_inverted = cv2.bitwise_not(gray)
    
    # Адаптивное пороговое значение для выделения объектов
    thresh = cv2.adaptiveThreshold(
        gray, 255, cv2.ADAPTIVE_THRESH_GAUSSIAN_C, cv2.THRESH_BINARY_INV, 23, 4
    )
    # Морфологические операции для улучшения выделения объектов
    kernel = np.ones((3, 3), np.uint8)
    morph = cv2.morphologyEx(thresh, cv2.MORPH_CLOSE, kernel, iterations=7)
    # Поиск контуров
    contours, _ = cv2.findContours(morph, cv2.RETR_EXTERNAL, cv2.CHAIN_APPROX_SIMPLE)
    largest_contour = max(contours, key=cv2.contourArea) if contours else None
    if largest_contour is not None:
        area = cv2.contourArea(largest_contour)
        cv2.drawContours(np_image, [largest_contour], -1, (0, 255, 0), 2)
        cv2.putText(np_image, f"Area: {int(area)}", (10, 30), cv2.FONT_HERSHEY_SIMPLEX, 1, (0, 255, 0), 2)
        cv2.drawContours(np_image, [largest_contour], -1, (0, 255, 0), 2)

        # Рисование змейкой внутри самого большого контура
        # Получаем границы контуров
        x, y, w, h = cv2.boundingRect(largest_contour)

        # Создаем змейку
        for i in range(0, h, 10):  # Шаг 10 пикселей по вертикали
            if (i // 10) % 2 == 0:  # Четные строки - влево
                cv2.line(np_image, (x, y + i), (x + w, y + i), (255, 0, 0), 1)
            else:  # Нечетные строки - вправо
                cv2.line(np_image, (x + w, y + i), (x, y + i), (255, 0, 0), 1)

    resized = cv2.resize(np_image, (720, 480))
    cv2.imshow("Processed Image", resized)
    
    cv2.waitKey(0) 
finally:
    cam.stream_off()
    cam.close_device()
    cv2.destroyAllWindows()
