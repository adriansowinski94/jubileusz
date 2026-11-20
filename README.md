# JubileuszApp

Centrum dowodzenia turnieju jubileuszowego (Asinho vs Kokog).
Flutter: Windows (ekran główny), Web (awaryjnie / laptop), Android (pilot). Dane: Supabase.

## Start
```
flutter pub get
copy config.example.json config.json   # uzupełnij URL i klucz Supabase
flutter run -d windows --dart-define-from-file=config.json
flutter run -d chrome  --dart-define-from-file=config.json
```

## Media (poza repo)
- Windows: folder `media/` w katalogu projektu
- Web: folder `web/media/`

## Wydanie
```
git tag v0.1.0
git push origin v0.1.0
```
GitHub Actions: testy → build Windows / Web / APK → GitHub Release.
Wymagane sekrety repo: `SUPABASE_URL`, `SUPABASE_KEY`.
