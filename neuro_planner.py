import torch #type: ignore
import cv2
import gxipy as gx

# Загрузка предобученной модели YOLOv5
model = torch.hub.load('ultralytics/yolov5', 'yolov5s', pretrained=True)

# Получаем изображение с камеры
device_manager = gx.DeviceManager()
cam = device_manager.open_device_by_index(1)
cam.stream_on()

try:
    while True:
        raw_image = cam.data_stream[0].get_image()
        if raw_image is None:
            continue

        rgb_image = raw_image.convert("RGB")
        np_image = rgb_image.get_numpy_array()

        # Преобразуем изображение в размер 640x640
        resized_image = cv2.resize(np_image, (640, 640))

        # Нормализация значений пикселей
        #resized_image = resized_image / 255.0

        # Конвертация в тензор
        results = model(resized_image)

        # Отображение результатов
        results.render()  # Отрисовка рамок на изображении
        output_img = results.ims[0]  # Изображение с рамками

        resized_output = cv2.resize(output_img, (720, 480))
        cv2.imshow("Object Detection", resized_output)

        if cv2.waitKey(1) & 0xFF == ord('q'):
            break

finally:
    cam.stream_off()
    cam.close_device()
    cv2.destroyAllWindows()
