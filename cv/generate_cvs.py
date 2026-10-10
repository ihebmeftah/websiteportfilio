#!/usr/bin/env python3
"""ATS-friendly CVs for Iheb Meftah. Facts come from his existing resume, GitHub, and public LinkedIn."""

from pathlib import Path

from docx import Document
from docx.enum.text import WD_ALIGN_PARAGRAPH, WD_LINE_SPACING
from docx.oxml import OxmlElement
from docx.oxml.ns import qn
from docx.shared import Cm, Mm, Pt, RGBColor
from reportlab.lib.colors import HexColor, white
from reportlab.lib.enums import TA_JUSTIFY, TA_LEFT, TA_RIGHT
from reportlab.lib.pagesizes import A4
from reportlab.lib.styles import ParagraphStyle
from reportlab.lib.units import mm
from reportlab.pdfbase import pdfmetrics
from reportlab.pdfbase.ttfonts import TTFont
from reportlab.platypus import (
    BaseDocTemplate,
    Frame,
    HRFlowable,
    Image,
    KeepTogether,
    PageTemplate,
    Paragraph,
    Spacer,
    Table,
    TableStyle,
)

ROOT = Path("/Users/maalejahmed/Documents/cv")
PHOTO = ROOT / "iheb.jpg"
FONT = "/System/Library/Fonts/Supplemental/Arial.ttf"
FONT_BOLD = "/System/Library/Fonts/Supplemental/Arial Bold.ttf"

pdfmetrics.registerFont(TTFont("Arial", FONT))
pdfmetrics.registerFont(TTFont("Arial-Bold", FONT_BOLD))

INK = HexColor("#1C1C1C")
MUTED = HexColor("#3F3F3F")
BLUE = HexColor("#0B3A82")
LINE = HexColor("#D5D8DE")
RULE = HexColor("#0B3A82")

EMAIL = "ihebmeftah666@gmail.com"
PHONE = "+49 155 11063642"
LINKEDIN = "https://www.linkedin.com/in/ihebmeftah666/"
GITHUB = "https://github.com/ihebmeftah"
PORTFOLIO = "https://ihebportfolio.web.app"


def esc(text: str) -> str:
    return (
        text.replace("&", "&amp;")
        .replace("<", "&lt;")
        .replace(">", "&gt;")
    )


# ---------------------------------------------------------------------------
# Content. Job titles and dates match the July 2026 resume. Degree years
# match the public LinkedIn education entry. No language level is invented
# beyond Arabic (native) and English (working language of the source CV).
# ---------------------------------------------------------------------------

PROFILES = {
    "en_flutter": (
        "Flutter mobile engineer and team lead in Kirchhain, Germany. Since June 2022 at EdTrust, "
        "led four Flutter applications for teachers, students, parents, and school administrators. "
        "Contract work covers inventory with offline sync and barcode scanning, an education app "
        "with the British Council, and roadside assistance with maps and live location. "
        "Stack: Dart, Firebase, REST APIs, CI/CD, GetX, BLoC, and Serverpod."
    ),
    "en_general": (
        "Software engineer in Kirchhain, Germany, with a mobile core and hands-on backend work. "
        "Since June 2022, led four production applications for teachers, students, parents, and "
        "school administrators. Ships features against REST and Firebase, including offline sync, "
        "real-time updates, authentication, and CI/CD. Also works in TypeScript (NestJS, Express, "
        "Angular, Ionic), PostgreSQL, MongoDB, and Serverpod."
    ),
    "de_flutter": (
        "Mobile-Entwickler mit Schwerpunkt Flutter und Dart, wohnhaft in Kirchhain. Seit Juni 2022 "
        "Team Lead bei EdTrust für vier Flutter-Anwendungen für Lehrkräfte, Schüler, Eltern und "
        "Schulverwaltung. Vertragsprojekte: Inventar mit Offline-Synchronisation und Barcode-Erfassung, "
        "eine Lernanwendung mit dem British Council sowie Pannenhilfe mit Karte und Standort. "
        "Stack: Dart, Firebase, REST-APIs, CI/CD, GetX, BLoC und Serverpod."
    ),
    "de_general": (
        "Softwareentwickler in Kirchhain. Schwerpunkt sind mobile Produkte und ihre Anbindung an "
        "Backend-Dienste. Seit Juni 2022 Team Lead bei EdTrust für vier produktive Anwendungen für "
        "Lehrkräfte, Schüler, Eltern und Schulverwaltung. Liefert Funktionen über REST und Firebase, "
        "inklusive Offline-Synchronisation, Echtzeitdaten, Authentifizierung und CI/CD. "
        "Weitere Praxis: TypeScript (NestJS, Express, Angular, Ionic), PostgreSQL, MongoDB und Serverpod."
    ),
}

ROLES = {
    "en_flutter": "Flutter Mobile Engineer",
    "en_general": "Software Engineer",
    "de_flutter": "Flutter-Entwickler / Mobile Engineer",
    "de_general": "Softwareentwickler / Software Engineer",
}

JOBS = {
    "en_flutter": [
        {
            "title": "Mobile Team Lead",
            "org": "EdTrust, Tunis",
            "dates": "June 2022 – Present",
            "text": (
                "Leads the mobile team and the delivery of four Flutter applications used by teachers, "
                "students, parents, and school administrators. The work covers a scalable architecture, "
                "Firebase, CI/CD pipelines, and API integrations, from feature development through release "
                "on iOS and Android."
            ),
        },
        {
            "title": "Mobile Developer (Contract)",
            "org": "Invertech",
            "dates": "September 2024 – July 2026",
            "text": (
                "Built an inventory application that keeps working online and offline. It scans barcodes, "
                "tracks missions in real time, and stays in sync through REST APIs, local storage, and "
                "live communication."
            ),
        },
        {
            "title": "Mobile Developer (Contract)",
            "org": "Azombwe",
            "dates": "January 2024 – June 2024",
            "text": (
                "Developed an education app of interactive quizzes on African culture, together with the "
                "British Council. Designed the interface and connected it to Firebase and REST APIs."
            ),
        },
        {
            "title": "Mobile Developer Intern",
            "org": "Rooly",
            "dates": "February 2023 – August 2023",
            "text": (
                "Worked on a roadside-assistance application that connects drivers with nearby service "
                "providers. Added geolocation, maps, authentication, and the API integration that supports "
                "those interactions in real time."
            ),
        },
    ],
    "en_general": [
        {
            "title": "Mobile Team Lead",
            "org": "EdTrust, Tunis",
            "dates": "June 2022 – Present",
            "text": (
                "Leads delivery of four production applications used by teachers, students, parents, and "
                "school administrators. Defined the architecture, connected Firebase and external APIs, "
                "and set up CI/CD so client features ship reliably against the backend services."
            ),
        },
        {
            "title": "Mobile Developer (Contract)",
            "org": "Invertech",
            "dates": "September 2024 – July 2026",
            "text": (
                "Delivered an inventory product with offline synchronization, barcode scanning, and live "
                "mission tracking. The client talks to REST APIs, keeps data locally, and updates through "
                "real-time communication."
            ),
        },
        {
            "title": "Mobile Developer (Contract)",
            "org": "Azombwe",
            "dates": "January 2024 – June 2024",
            "text": (
                "Built an education product of interactive quizzes on African culture, with the British "
                "Council. Implemented the interface and connected the client to Firebase and REST APIs."
            ),
        },
        {
            "title": "Mobile Developer Intern",
            "org": "Rooly",
            "dates": "February 2023 – August 2023",
            "text": (
                "Implemented features for a roadside-assistance service that matches drivers with nearby "
                "providers. The work added authentication, geolocation, maps, and the API layer behind them."
            ),
        },
    ],
    "de_flutter": [
        {
            "title": "Mobile Team Lead",
            "org": "EdTrust, Tunis",
            "dates": "Juni 2022 – heute",
            "text": (
                "Leitet das mobile Team und die Auslieferung von vier Flutter-Anwendungen für Lehrkräfte, "
                "Schüler, Eltern und die Schulverwaltung. Die Arbeit umfasst eine skalierbare Architektur, "
                "Firebase, CI/CD-Pipelines und API-Anbindungen, von der Funktion bis zum Release für iOS und Android."
            ),
        },
        {
            "title": "Mobile-Entwickler (Vertrag)",
            "org": "Invertech",
            "dates": "September 2024 – Juli 2026",
            "text": (
                "Eine Inventar-Anwendung entwickelt, die online und offline nutzbar bleibt. Sie erfasst "
                "Barcodes, verfolgt Einsätze in Echtzeit und hält die Daten über REST-APIs, lokale "
                "Speicherung und Echtzeitkommunikation synchron."
            ),
        },
        {
            "title": "Mobile-Entwickler (Vertrag)",
            "org": "Azombwe",
            "dates": "Januar 2024 – Juni 2024",
            "text": (
                "Eine Lernanwendung mit interaktiven Quiz zu afrikanischer Kultur entwickelt, gemeinsam mit "
                "dem British Council. Die Oberfläche wurde gestaltet und an Firebase sowie REST-APIs angebunden."
            ),
        },
        {
            "title": "Mobile-Entwickler (Praktikum)",
            "org": "Rooly",
            "dates": "Februar 2023 – August 2023",
            "text": (
                "Funktionen einer Pannenhilfe-App umgesetzt, die Fahrer mit nahe gelegenen Dienstleistern "
                "verbindet. Geolokalisierung, Karten, Authentifizierung und die API-Anbindung ermöglichen "
                "die Interaktion in Echtzeit."
            ),
        },
    ],
    "de_general": [
        {
            "title": "Mobile Team Lead",
            "org": "EdTrust, Tunis",
            "dates": "Juni 2022 – heute",
            "text": (
                "Leitet die Auslieferung von vier produktiven Anwendungen für Lehrkräfte, Schüler, Eltern "
                "und die Schulverwaltung. Architektur definiert, Firebase und externe APIs angebunden und "
                "CI/CD aufgesetzt, damit Client-Funktionen zuverlässig gegen die Backend-Dienste ausgeliefert werden."
            ),
        },
        {
            "title": "Mobile-Entwickler (Vertrag)",
            "org": "Invertech",
            "dates": "September 2024 – Juli 2026",
            "text": (
                "Ein Inventarprodukt mit Offline-Synchronisation, Barcode-Erfassung und Live-Einsatzverfolgung "
                "geliefert. Der Client spricht mit REST-APIs, hält Daten lokal und aktualisiert sie über "
                "Echtzeitkommunikation."
            ),
        },
        {
            "title": "Mobile-Entwickler (Vertrag)",
            "org": "Azombwe",
            "dates": "Januar 2024 – Juni 2024",
            "text": (
                "Eine Lernanwendung mit interaktiven Quiz zu afrikanischer Kultur aufgebaut, gemeinsam mit "
                "dem British Council. Die Oberfläche wurde umgesetzt und der Client an Firebase und REST-APIs angebunden."
            ),
        },
        {
            "title": "Mobile-Entwickler (Praktikum)",
            "org": "Rooly",
            "dates": "Februar 2023 – August 2023",
            "text": (
                "Produktfunktionen eines Pannenhilfe-Dienstes umgesetzt, der Fahrer an nahe Anbieter vermittelt. "
                "Dazu kamen Authentifizierung, Geolokalisierung, Karten und die dazugehörige API-Anbindung."
            ),
        },
    ],
}

EDU = {
    "en": (
        "Engineer's degree, Computer Software Engineering",
        "TEK-UP University of Digital Sciences, Ariana, Tunisia",
        "2023 – 2026",
    ),
    "de": (
        "Ingenieurdiplom, Computer Software Engineering",
        "TEK-UP University of Digital Sciences, Ariana, Tunesien",
        "2023 – 2026",
    ),
}

PROJECTS = {
    "en_flutter": [
        (
            "Sip &amp; Sync POS",
            "Flutter, Dart, and Serverpod. Café system for several locations, with real-time orders and inventory. Built for the Serverpod Flutter Hackathon (Devpost).",
            "https://github.com/ihebmeftah/sip_sync",
        ),
        (
            "E-commerce application",
            "Flutter, GetX, Firebase, and MVC, covering storefront flows on mobile and web.",
            "https://github.com/ihebmeftah/E-commerce-Full-App-Web-Getx---Firebase-Mvc",
        ),
        (
            "Movies applications",
            "One client in Ionic and TypeScript, and a native SwiftUI client.",
            "https://github.com/ihebmeftah/movies_ionic_project",
        ),
    ],
    "en_general": [
        (
            "Sip &amp; Sync POS",
            "Flutter client with a Serverpod backend. Multi-location café operations, real-time orders, and inventory. Serverpod Flutter Hackathon (Devpost).",
            "https://github.com/ihebmeftah/sip_sync",
        ),
        (
            "GraphQL API",
            "TypeScript service with NestJS and GraphQL.",
            "https://github.com/ihebmeftah/nest_graphql",
        ),
        (
            "E-commerce application",
            "Flutter, GetX, Firebase, and MVC for mobile and web.",
            "https://github.com/ihebmeftah/E-commerce-Full-App-Web-Getx---Firebase-Mvc",
        ),
        (
            "Movies applications",
            "Ionic/TypeScript client and a native SwiftUI client, against the same product idea.",
            "https://github.com/ihebmeftah/movieapp_ios_swiftui",
        ),
    ],
    "de_flutter": [
        (
            "Sip &amp; Sync POS",
            "Flutter, Dart und Serverpod. Kassensystem für Cafés mit mehreren Standorten, Echtzeit-Bestellungen und Bestände. Serverpod Flutter Hackathon (Devpost).",
            "https://github.com/ihebmeftah/sip_sync",
        ),
        (
            "E-Commerce-Anwendung",
            "Flutter, GetX, Firebase und MVC für Shop-Abläufe auf Mobile und Web.",
            "https://github.com/ihebmeftah/E-commerce-Full-App-Web-Getx---Firebase-Mvc",
        ),
        (
            "Film-Anwendungen",
            "Ein Client mit Ionic und TypeScript sowie ein nativer SwiftUI-Client.",
            "https://github.com/ihebmeftah/movies_ionic_project",
        ),
    ],
    "de_general": [
        (
            "Sip &amp; Sync POS",
            "Flutter-Client mit Serverpod-Backend. Café-Betrieb an mehreren Standorten, Echtzeit-Bestellungen und Bestände. Serverpod Flutter Hackathon (Devpost).",
            "https://github.com/ihebmeftah/sip_sync",
        ),
        (
            "GraphQL-API",
            "TypeScript-Dienst mit NestJS und GraphQL.",
            "https://github.com/ihebmeftah/nest_graphql",
        ),
        (
            "E-Commerce-Anwendung",
            "Flutter, GetX, Firebase und MVC für Mobile und Web.",
            "https://github.com/ihebmeftah/E-commerce-Full-App-Web-Getx---Firebase-Mvc",
        ),
        (
            "Film-Anwendungen",
            "Client in Ionic/TypeScript und nativer SwiftUI-Client zur selben Produktidee.",
            "https://github.com/ihebmeftah/movieapp_ios_swiftui",
        ),
    ],
}

SKILLS = {
    "en_flutter": [
        ("Mobile", "Flutter, Dart, GetX, BLoC, SwiftUI, iOS, Android"),
        ("Data and APIs", "Firebase, REST APIs, Serverpod, Shelf, Frog, offline synchronization, local storage"),
        ("Product features", "Barcode scanning, geolocation, maps, authentication, real-time updates"),
        ("Engineering", "CI/CD, Git, GitHub, scalable app architecture"),
        ("Also used", "TypeScript, NestJS, Express, Angular, Ionic, PostgreSQL, MongoDB"),
    ],
    "en_general": [
        ("Languages", "Dart, TypeScript, JavaScript"),
        ("Mobile", "Flutter, GetX, BLoC, SwiftUI, Ionic, iOS, Android"),
        ("Backend", "NestJS, Express, Serverpod, Shelf, Frog, REST APIs, GraphQL"),
        ("Data", "PostgreSQL, MongoDB, Firebase, local storage, offline synchronization"),
        ("Engineering", "CI/CD, Git, GitHub, authentication, real-time communication"),
    ],
    "de_flutter": [
        ("Mobile", "Flutter, Dart, GetX, BLoC, SwiftUI, iOS, Android"),
        ("Daten und APIs", "Firebase, REST-APIs, Serverpod, Shelf, Frog, Offline-Synchronisation, lokale Speicherung"),
        ("Produktfunktionen", "Barcode-Erfassung, Geolokalisierung, Karten, Authentifizierung, Echtzeitdaten"),
        ("Engineering", "CI/CD, Git, GitHub, skalierbare App-Architektur"),
        ("Weitere Praxis", "TypeScript, NestJS, Express, Angular, Ionic, PostgreSQL, MongoDB"),
    ],
    "de_general": [
        ("Sprachen und Plattformen", "Dart, TypeScript, JavaScript, Flutter, Ionic, iOS, Android"),
        ("Backend", "NestJS, Express, Serverpod, Shelf, Frog, REST-APIs, GraphQL"),
        ("Daten", "PostgreSQL, MongoDB, Firebase, lokale Speicherung, Offline-Synchronisation"),
        ("Engineering", "CI/CD, Git, GitHub, Authentifizierung, Echtzeitkommunikation, GetX, BLoC"),
    ],
}

LANGS = {
    "en": [
        ("Arabic", "Native"),
        ("French", "Second language"),
        ("English", "Full professional proficiency"),
        ("German", "A2 — currently learning"),
    ],
    "de": [
        ("Arabisch", "Muttersprache"),
        ("Französisch", "Zweitsprache"),
        ("Englisch", "Fließend (Berufssprache)"),
        ("Deutsch", "A2 — derzeit im Lernprozess"),
    ],
}

LABELS = {
    "en_flutter": {
        "kind": "europass",
        "lang": "en",
        "doc_title": "Curriculum vitae — Iheb Meftah — Flutter Mobile Engineer",
        "cv_label": "Europass",
        "applied": "Job applied for",
        "profile": "Profile",
        "experience": "Work experience",
        "education": "Education and training",
        "projects": "Projects",
        "skills": "Digital skills",
        "languages": "Languages",
        "email": "Email",
        "phone": "Phone",
        "location": "Address",
        "location_value": "Kirchhain, Germany",
    },
    "en_general": {
        "kind": "europass",
        "lang": "en",
        "doc_title": "Curriculum vitae — Iheb Meftah — Software Engineer",
        "cv_label": "Europass",
        "applied": "Job applied for",
        "profile": "Profile",
        "experience": "Work experience",
        "education": "Education and training",
        "projects": "Projects",
        "skills": "Digital skills",
        "languages": "Languages",
        "email": "Email",
        "phone": "Phone",
        "location": "Address",
        "location_value": "Kirchhain, Germany",
    },
    "de_flutter": {
        "kind": "de",
        "lang": "de",
        "doc_title": "Lebenslauf — Iheb Meftah — Flutter-Entwickler",
        "cv_label": "Lebenslauf",
        "applied": "Zielposition",
        "profile": "Profil",
        "experience": "Berufserfahrung",
        "education": "Ausbildung",
        "projects": "Projekte",
        "skills": "Kenntnisse",
        "languages": "Sprachen",
        "email": "E-Mail",
        "phone": "Telefon",
        "location": "Wohnort",
        "location_value": "Kirchhain, Deutschland",
    },
    "de_general": {
        "kind": "de",
        "lang": "de",
        "doc_title": "Lebenslauf — Iheb Meftah — Softwareentwickler",
        "cv_label": "Lebenslauf",
        "applied": "Zielposition",
        "profile": "Profil",
        "experience": "Berufserfahrung",
        "education": "Ausbildung",
        "projects": "Projekte",
        "skills": "Kenntnisse",
        "languages": "Sprachen",
        "email": "E-Mail",
        "phone": "Telefon",
        "location": "Wohnort",
        "location_value": "Kirchhain, Deutschland",
    },
}

FILES = {
    "en_flutter": "Europass_Flutter_Mobile_Iheb_Meftah",
    "en_general": "Europass_Software_Engineer_Iheb_Meftah",
    "de_flutter": "Lebenslauf_Flutter_Mobil_DE_Iheb_Meftah",
    "de_general": "Lebenslauf_Software_Engineer_DE_Iheb_Meftah",
}


def pdf_styles():
    return {
        "kicker": ParagraphStyle(
            "kicker",
            fontName="Arial",
            fontSize=8,
            leading=9,
            textColor=BLUE,
            spaceAfter=0,
        ),
        "name": ParagraphStyle(
            "name",
            fontName="Arial-Bold",
            fontSize=16,
            leading=18,
            textColor=INK,
            spaceAfter=0,
        ),
        "role": ParagraphStyle(
            "role",
            fontName="Arial-Bold",
            fontSize=10,
            leading=12,
            textColor=BLUE,
            spaceBefore=0,
            spaceAfter=1,
        ),
        "contact": ParagraphStyle(
            "contact",
            fontName="Arial",
            fontSize=8,
            leading=10.2,
            textColor=INK,
        ),
        "section": ParagraphStyle(
            "section",
            fontName="Arial-Bold",
            fontSize=11,
            leading=13,
            textColor=BLUE,
            spaceBefore=0,
            spaceAfter=1,
        ),
        "body": ParagraphStyle(
            "body",
            fontName="Arial",
            fontSize=9,
            leading=11.3,
            textColor=INK,
            alignment=TA_LEFT,
        ),
        "job": ParagraphStyle(
            "job",
            fontName="Arial-Bold",
            fontSize=9.5,
            leading=11.5,
            textColor=INK,
        ),
        "meta": ParagraphStyle(
            "meta",
            fontName="Arial",
            fontSize=8.5,
            leading=10.5,
            textColor=MUTED,
        ),
        "dates": ParagraphStyle(
            "dates",
            fontName="Arial",
            fontSize=8.5,
            leading=10.5,
            textColor=INK,
            alignment=TA_RIGHT,
        ),
        "bullet": ParagraphStyle(
            "bullet",
            fontName="Arial",
            fontSize=9,
            leading=11.2,
            textColor=INK,
            leftIndent=8,
            bulletIndent=0,
            bulletFontName="Arial",
            bulletFontSize=8,
        ),
        "skill": ParagraphStyle(
            "skill",
            fontName="Arial",
            fontSize=9,
            leading=11.2,
            textColor=INK,
        ),
    }


def section_heading(text, styles):
    label = Paragraph(esc(text).upper(), styles["section"])
    rule = HRFlowable(width="100%", thickness=0.6, color=RULE, spaceBefore=0, spaceAfter=2)
    return KeepTogether([Spacer(1, 5), label, rule])


def job_block(job, styles):
    left = Paragraph(esc(job["title"]), styles["job"])
    right = Paragraph(esc(job["dates"]), styles["dates"])
    head = Table([[left, right]], colWidths=[132 * mm, 46 * mm])
    head.setStyle(
        TableStyle(
            [
                ("VALIGN", (0, 0), (-1, -1), "TOP"),
                ("LEFTPADDING", (0, 0), (-1, -1), 0),
                ("RIGHTPADDING", (0, 0), (-1, -1), 0),
                ("TOPPADDING", (0, 0), (-1, -1), 0),
                ("BOTTOMPADDING", (0, 0), (-1, -1), 0),
            ]
        )
    )
    org = Paragraph(esc(job["org"]), styles["meta"])
    body = Paragraph(esc(job["text"]), styles["body"])
    return KeepTogether([Spacer(1, 3), head, org, Spacer(1, 1), body])


def build_pdf(key: str):
    labels = LABELS[key]
    styles = pdf_styles()
    path = ROOT / f"{FILES[key]}.pdf"
    doc = BaseDocTemplate(
        str(path),
        pagesize=A4,
        title=labels["doc_title"],
        author="Iheb Meftah",
        leftMargin=14 * mm,
        rightMargin=14 * mm,
        topMargin=11 * mm,
        bottomMargin=11 * mm,
    )
    frame = Frame(doc.leftMargin, doc.bottomMargin, doc.width, doc.height, id="main", showBoundary=0)

    def on_page(canvas, document):
        canvas.saveState()
        canvas.setFillColor(BLUE)
        canvas.rect(0, A4[1] - 3.2 * mm, A4[0], 3.2 * mm, fill=1, stroke=0)
        canvas.setFillColor(MUTED)
        canvas.setFont("Arial", 8)
        canvas.drawString(14 * mm, 5.5 * mm, "Iheb Meftah")
        canvas.drawRightString(A4[0] - 14 * mm, 5.5 * mm, str(document.page))
        canvas.restoreState()

    doc.addPageTemplates([PageTemplate(id="main", frames=[frame], onPage=on_page)])

    photo = Image(str(PHOTO), width=26 * mm, height=26 * mm, kind="proportional")
    contact_lines = [
        f"<b>{esc(labels['email'])}:</b> <a href='mailto:{EMAIL}' color='#0B3A82'>{esc(EMAIL)}</a>",
        f"<b>{esc(labels['phone'])}:</b> {esc(PHONE)}",
        f"<b>{esc(labels['location'])}:</b> {esc(labels['location_value'])}",
        f"<b>LinkedIn:</b> <a href='{LINKEDIN}' color='#0B3A82'>linkedin.com/in/ihebmeftah666</a>",
        f"<b>GitHub:</b> <a href='{GITHUB}' color='#0B3A82'>github.com/ihebmeftah</a>",
        f"<b>Portfolio:</b> <a href='{PORTFOLIO}' color='#0B3A82'>ihebportfolio.web.app</a>",
    ]
    left_bits = [
        Paragraph(esc(labels["cv_label"]).upper(), styles["kicker"]),
        Paragraph("Iheb Meftah", styles["name"]),
        Paragraph(esc(ROLES[key]), styles["role"]),
        Spacer(1, 2),
    ]
    for line in contact_lines:
        left_bits.append(Paragraph(line, styles["contact"]))
    left = left_bits
    header = Table([[left, photo]], colWidths=[148 * mm, 30 * mm])
    header.setStyle(
        TableStyle(
            [
                ("VALIGN", (0, 0), (-1, -1), "TOP"),
                ("ALIGN", (1, 0), (1, 0), "RIGHT"),
                ("LEFTPADDING", (0, 0), (-1, -1), 0),
                ("RIGHTPADDING", (0, 0), (-1, -1), 0),
                ("TOPPADDING", (0, 0), (-1, -1), 0),
                ("BOTTOMPADDING", (0, 0), (-1, -1), 0),
            ]
        )
    )

    story = [header]
    story.append(section_heading(labels["profile"], styles))
    story.append(Paragraph(esc(PROFILES[key]), styles["body"]))
    story.append(section_heading(labels["experience"], styles))
    for job in JOBS[key]:
        story.append(job_block(job, styles))

    edu_title, edu_org, edu_dates = EDU["de" if labels["lang"] == "de" else "en"]
    story.append(section_heading(labels["education"], styles))
    edu_head = Table(
        [[Paragraph(esc(edu_title), styles["job"]), Paragraph(esc(edu_dates), styles["dates"])]],
        colWidths=[132 * mm, 46 * mm],
    )
    edu_head.setStyle(
        TableStyle(
            [
                ("VALIGN", (0, 0), (-1, -1), "TOP"),
                ("LEFTPADDING", (0, 0), (-1, -1), 0),
                ("RIGHTPADDING", (0, 0), (-1, -1), 0),
                ("TOPPADDING", (0, 0), (-1, -1), 0),
                ("BOTTOMPADDING", (0, 0), (-1, -1), 0),
            ]
        )
    )
    story.append(Spacer(1, 4))
    story.append(edu_head)
    story.append(Paragraph(esc(edu_org), styles["meta"]))

    story.append(section_heading(labels["projects"], styles))
    for name, detail, url in PROJECTS[key]:
        block = KeepTogether(
            [
                Spacer(1, 2),
                Paragraph(f"<b>{name}</b> — {esc(detail)}", styles["body"]),
                Paragraph(f"<a href='{url}' color='#0B3A82'>{esc(url.replace('https://', ''))}</a>", styles["meta"]),
            ]
        )
        story.append(block)

    story.append(section_heading(labels["skills"], styles))
    for i, (group, items) in enumerate(SKILLS[key]):
        story.append(Paragraph(f"<b>{esc(group)}:</b> {esc(items)}", styles["skill"]))
        if i < len(SKILLS[key]) - 1:
            story.append(Spacer(1, 1.5))

    story.append(section_heading(labels["languages"], styles))
    lang_bits = " · ".join(f"<b>{esc(n)}</b> — {esc(level)}" for n, level in LANGS[labels["lang"]])
    story.append(Paragraph(lang_bits, styles["body"]))

    doc.build(story)
    return path


def set_run_font(run, name="Calibri", size=11, bold=False, color=None):
    run.font.name = name
    run._element.rPr.rFonts.set(qn("w:eastAsia"), name)
    run.font.size = Pt(size)
    run.bold = bold
    if color:
        run.font.color.rgb = RGBColor(*color)


def add_hyperlink(paragraph, text, url, size=11, bold=False):
    part = paragraph.part
    r_id = part.relate_to(
        url,
        "http://schemas.openxmlformats.org/officeDocument/2006/relationships/hyperlink",
        is_external=True,
    )
    hyperlink = OxmlElement("w:hyperlink")
    hyperlink.set(qn("r:id"), r_id)
    new_run = OxmlElement("w:r")
    r_pr = OxmlElement("w:rPr")
    color = OxmlElement("w:color")
    color.set(qn("w:val"), "0B3A82")
    r_pr.append(color)
    underline = OxmlElement("w:u")
    underline.set(qn("w:val"), "single")
    r_pr.append(underline)
    sz = OxmlElement("w:sz")
    sz.set(qn("w:val"), str(int(size * 2)))
    r_pr.append(sz)
    r_fonts = OxmlElement("w:rFonts")
    r_fonts.set(qn("w:ascii"), "Calibri")
    r_fonts.set(qn("w:hAnsi"), "Calibri")
    r_pr.append(r_fonts)
    if bold:
        b = OxmlElement("w:b")
        r_pr.append(b)
    new_run.append(r_pr)
    text_elem = OxmlElement("w:t")
    text_elem.text = text
    new_run.append(text_elem)
    hyperlink.append(new_run)
    paragraph._p.append(hyperlink)


def shade_paragraph(paragraph):
    p_pr = paragraph._p.get_or_add_pPr()
    p_bdr = OxmlElement("w:pBdr")
    bottom = OxmlElement("w:bottom")
    bottom.set(qn("w:val"), "single")
    bottom.set(qn("w:sz"), "8")
    bottom.set(qn("w:space"), "1")
    bottom.set(qn("w:color"), "0B3A82")
    p_bdr.append(bottom)
    p_pr.append(p_bdr)


def set_doc_language(doc, lang):
    styles = doc.styles
    for style_name in ("Normal", "Heading 1", "Title"):
        style = styles[style_name]
        r_pr = style.element.get_or_add_rPr()
        lang_el = r_pr.find(qn("w:lang"))
        if lang_el is None:
            lang_el = OxmlElement("w:lang")
            r_pr.append(lang_el)
        lang_el.set(qn("w:val"), lang)
        lang_el.set(qn("w:eastAsia"), lang)


def add_text(paragraph, text, size=11, bold=False, color=None, font="Calibri"):
    run = paragraph.add_run(text)
    set_run_font(run, font, size, bold, color)
    return run


def tighten(paragraph, before=0, after=2, line=1.05):
    fmt = paragraph.paragraph_format
    fmt.space_before = Pt(before)
    fmt.space_after = Pt(after)
    fmt.line_spacing = line
    fmt.line_spacing_rule = WD_LINE_SPACING.MULTIPLE


def build_docx(key: str):
    labels = LABELS[key]
    doc = Document()
    section = doc.sections[0]
    section.page_width = Mm(210)
    section.page_height = Mm(297)
    section.left_margin = Cm(1.6)
    section.right_margin = Cm(1.6)
    section.top_margin = Cm(1.4)
    section.bottom_margin = Cm(1.4)
    lang = "de-DE" if labels["lang"] == "de" else "en-US"
    set_doc_language(doc, lang)

    normal = doc.styles["Normal"]
    normal.font.name = "Calibri"
    normal.font.size = Pt(11)
    normal.font.color.rgb = RGBColor(0x1C, 0x1C, 0x1C)
    normal._element.rPr.rFonts.set(qn("w:eastAsia"), "Calibri")

    heading = doc.styles["Heading 1"]
    heading.font.name = "Calibri"
    heading.font.size = Pt(13)
    heading.font.bold = True
    heading.font.color.rgb = RGBColor(0x0B, 0x3A, 0x82)
    heading._element.rPr.rFonts.set(qn("w:eastAsia"), "Calibri")
    heading.paragraph_format.space_before = Pt(12)
    heading.paragraph_format.space_after = Pt(4)

    core = doc.core_properties
    core.author = "Iheb Meftah"
    core.title = labels["doc_title"]
    core.subject = labels["doc_title"]
    core.category = "CV"
    core.language = lang

    kicker = doc.add_paragraph()
    tighten(kicker, 0, 0)
    add_text(kicker, labels["cv_label"].upper(), 9, True, (0x0B, 0x3A, 0x82))

    name = doc.add_paragraph()
    tighten(name, 0, 0)
    add_text(name, "Iheb Meftah", 22, True, (0x1C, 0x1C, 0x1C))

    role = doc.add_paragraph()
    tighten(role, 0, 4)
    add_text(role, ROLES[key], 13, True, (0x0B, 0x3A, 0x82))

    try:
        pic = doc.add_paragraph()
        tighten(pic, 0, 4)
        run = pic.add_run()
        run.add_picture(str(PHOTO), width=Cm(2.6))
    except Exception:
        pass

    def labeled(label, value, url=None):
        p = doc.add_paragraph()
        tighten(p, 0, 0, 1.0)
        add_text(p, f"{label}: ", 11, True)
        if url:
            add_hyperlink(p, value, url, 11)
        else:
            add_text(p, value, 11)

    labeled(labels["email"], EMAIL, f"mailto:{EMAIL}")
    labeled(labels["phone"], PHONE)
    labeled(labels["location"], labels["location_value"])
    labeled("LinkedIn", "linkedin.com/in/ihebmeftah666", LINKEDIN)
    labeled("GitHub", "github.com/ihebmeftah", GITHUB)
    labeled("Portfolio", "ihebportfolio.web.app", PORTFOLIO)

    def h1(text):
        p = doc.add_heading(text, level=1)
        shade_paragraph(p)
        return p

    h1(labels["profile"])
    p = doc.add_paragraph()
    tighten(p, 0, 2, 1.08)
    add_text(p, PROFILES[key], 11)

    h1(labels["experience"])
    for job in JOBS[key]:
        p = doc.add_paragraph()
        tighten(p, 8, 0)
        add_text(p, job["title"], 12, True)
        add_text(p, "  |  ", 12)
        add_text(p, job["dates"], 11)
        p = doc.add_paragraph()
        tighten(p, 0, 1)
        add_text(p, job["org"], 11, False, (0x3F, 0x3F, 0x3F))
        bp = doc.add_paragraph()
        tighten(bp, 1, 2, 1.05)
        add_text(bp, job["text"], 11)

    edu_title, edu_org, edu_dates = EDU["de" if labels["lang"] == "de" else "en"]
    h1(labels["education"])
    p = doc.add_paragraph()
    tighten(p, 2, 0)
    add_text(p, edu_title, 12, True)
    add_text(p, "  |  ", 12)
    add_text(p, edu_dates, 11)
    p = doc.add_paragraph()
    tighten(p, 0, 2)
    add_text(p, edu_org, 11, False, (0x3F, 0x3F, 0x3F))

    h1(labels["projects"])
    for name, detail, url in PROJECTS[key]:
        p = doc.add_paragraph()
        tighten(p, 6, 0)
        add_text(p, name.replace("&amp;", "&"), 12, True)
        p = doc.add_paragraph()
        tighten(p, 0, 0, 1.05)
        add_text(p, detail, 11)
        p = doc.add_paragraph()
        tighten(p, 0, 1)
        add_hyperlink(p, url.replace("https://", ""), url, 11)

    h1(labels["skills"])
    for group, items in SKILLS[key]:
        p = doc.add_paragraph()
        tighten(p, 1, 1, 1.05)
        add_text(p, f"{group}: ", 11, True)
        add_text(p, items, 11)

    h1(labels["languages"])
    for name, level in LANGS[labels["lang"]]:
        p = doc.add_paragraph()
        tighten(p, 0, 0)
        add_text(p, f"{name}: ", 11, True)
        add_text(p, level, 11)

    path = ROOT / f"{FILES[key]}.docx"
    doc.save(path)
    return path


def main():
    for key in FILES:
        pdf = build_pdf(key)
        docx = build_docx(key)
        print(pdf.name)
        print(docx.name)


if __name__ == "__main__":
    main()
