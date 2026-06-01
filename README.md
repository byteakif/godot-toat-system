
# Godot Toast System (Animated UI Notifications)

GDScript ile yazılmış Android tarzı toast bildirim sistemi.

Godot 4.x için geliştirilmiştir.

---

## Kurulum

1. `Toast.gd` scriptini projeye ekle
2. `Toast.gd` scriptini "Toast" olarak otamatik yükleme listesine ekle
3. Scripti kodun da çağır.

---

### Parametreler

* text → Gösterilecek mesaj
* time → Ekranda kalma süresi (saniye) - default 0.5 sn

---

## Sistem Yapısı

```
CanvasLayer
 └── Panel
      └── MarginContainer
           └── Label
```

---

## Çalışma Mantığı

1. Metin alınır
2. Label’a yazılır
3. Ekran alt-orta konuma yerleştirilir
4. Animasyon başlar:
   * Fade in
   * Scale animasyonu
   * Bekleme
   * Fade out
5. Otomatik kapanır

---

## Örnek

```gdscript
func _ready():
	$Toast.show_toast("Oyun başladı!")
	$Toast.show_toast("Coin +10", 1.5)
	$Toast.show_toast("Hata oluştu!", 3.0)
	$Toast.costuminfo_show_toast("işlem başarılı", SUCCESS)
	$Toast.costuminfo_show_toast("Hata oluştu!", ERROR)
	$Toast.costuminfo_show_toast("Burda çökme oluşabilir", WARNING)
	$Toast.costuminfo_show_toast("İşlem başarılı", INFO)
```
---
Developer: [@byteakif](https://github.com/byteakif)

## Lisans

MIT License - Ticari projelerde özgürce kullanıla bilir.
