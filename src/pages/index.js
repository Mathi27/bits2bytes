import clsx from 'clsx';
import Link from '@docusaurus/Link';
import useDocusaurusContext from '@docusaurus/useDocusaurusContext';
import Layout from '@theme/Layout';
import HomepageFeatures from '@site/src/components/HomepageFeatures';
import Heading from '@theme/Heading';
import styles from './index.module.css';

// Terminal-style animated text component
function TerminalText() {
  return (
    <div className={styles.terminalWindow}>
      <div className={styles.terminalHeader}>
        <span className={styles.terminalDot} style={{ background: '#ff5f56' }}></span>
        <span className={styles.terminalDot} style={{ background: '#ffbd2e' }}></span>
        <span className={styles.terminalDot} style={{ background: '#27ca40' }}></span>
        <span className={styles.terminalTitle}>bits2bytes.sh</span>
      </div>
      <div className={styles.terminalBody}>
        <code>
          <span className={styles.terminalPrompt}>$</span> learn --embedded --iot --robotics
          <br />
          <span className={styles.terminalOutput}>→ Loading hands-on labs...</span>
          <br />
          <span className={styles.terminalSuccess}>✓ Ready to build!</span>
        </code>
      </div>
    </div>
  );
}

function HomepageHeader() {
  const { siteConfig } = useDocusaurusContext();
  return (
    <header className={styles.heroBanner}>
      <div className={styles.heroContainer}>
        <div className={styles.heroContent}>
          <div className={styles.heroLabel}>
            <span className={styles.labelIcon}>⚡</span>
            Open-Source Learning Initiative
          </div>
          <Heading as="h1" className={styles.heroTitle}>
            <span className={styles.titleAccent}>Bits</span>2<span className={styles.titleAccent}>Bytes</span>
            <span className={styles.titleSub}>Labs</span>
          </Heading>
          <p className={styles.heroSubtitle}>
            {siteConfig.tagline}
          </p>
          <p className={styles.heroDescription}>
            Hands-on, lab-driven learning in <strong>Embedded Systems</strong>, <strong>Robotics</strong>, and <strong>IoT</strong>. 
            Progress from fundamental concepts to real-world applications through structured experiments.
          </p>
          <div className={styles.heroButtons}>
            <Link
              className={clsx('button button--lg', styles.primaryButton)}
              to="docs/stm32-intro">
              Start Learning
              <span className={styles.buttonArrow}>→</span>
            </Link>
            <Link
              className={clsx('button button--lg', styles.secondaryButton)}
              to="https://github.com/Mathi27/bits2bytes">
              View on GitHub
            </Link>
          </div>
          <div className={styles.heroStats}>
            <div className={styles.statItem}>
              <span className={styles.statIcon}>📚</span>
              <span className={styles.statText}>Structured Labs</span>
            </div>
            <div className={styles.statItem}>
              <span className={styles.statIcon}>🔧</span>
              <span className={styles.statText}>Practical First</span>
            </div>
            <div className={styles.statItem}>
              <span className={styles.statIcon}>🌍</span>
              <span className={styles.statText}>Community Driven</span>
            </div>
          </div>
        </div>
        <div className={styles.heroVisual}>
          <TerminalText />
        </div>
      </div>
    </header>
  );
}

// Learning Path Section
function LearningPathSection() {
  const paths = [
    {
      icon: '🔌',
      title: 'Embedded Systems',
      description: 'Microcontrollers, GPIO, Timers, Interrupts, Communication Protocols',
      level: 'Fundamentals → Advanced',
    },
    {
      icon: '🤖',
      title: 'Robotics',
      description: 'Motor control, Sensors, Kinematics, Autonomous systems',
      level: 'Beginner → Intermediate',
    },
    {
      icon: '📡',
      title: 'IoT & Connectivity',
      description: 'WiFi, MQTT, Cloud integration, Edge computing',
      level: 'Coming Soon',
    },
  ];

  return (
    <section className={styles.pathSection}>
      <div className="container">
        <div className={styles.sectionHeader}>
          <span className={styles.sectionLabel}>Learning Paths</span>
          <Heading as="h2" className={styles.sectionTitle}>
            Structured Journey from Bits to Bytes
          </Heading>
          <p className={styles.sectionSubtitle}>
            Each path is designed with incremental complexity, ensuring you build strong foundations before advancing.
          </p>
        </div>
        <div className={styles.pathGrid}>
          {paths.map((path, idx) => (
            <div key={idx} className={styles.pathCard}>
              <div className={styles.pathIcon}>{path.icon}</div>
              <h3 className={styles.pathTitle}>{path.title}</h3>
              <p className={styles.pathDescription}>{path.description}</p>
              <span className={styles.pathLevel}>{path.level}</span>
            </div>
          ))}
        </div>
      </div>
    </section>
  );
}

// Philosophy Section
function PhilosophySection() {
  return (
    <section className={styles.philosophySection}>
      <div className="container">
        <div className={styles.philosophyGrid}>
          <div className={styles.philosophyContent}>
            <span className={styles.sectionLabel}>Our Philosophy</span>
            <Heading as="h2" className={styles.sectionTitle}>
              Learn by Building, Not Just Reading
            </Heading>
            <p className={styles.philosophyText}>
              We believe in learning through experimentation. Every concept is paired with practical labs 
              and real hardware projects. Theory meets practice in every lesson.
            </p>
            <ul className={styles.philosophyList}>
              <li>
                <span className={styles.checkIcon}>✓</span>
                Lab experiments with clear objectives
              </li>
              <li>
                <span className={styles.checkIcon}>✓</span>
                Step-by-step hardware setup guides
              </li>
              <li>
                <span className={styles.checkIcon}>✓</span>
                Code samples you can run immediately
              </li>
              <li>
                <span className={styles.checkIcon}>✓</span>
                Troubleshooting tips from experience
              </li>
            </ul>
          </div>
          <div className={styles.philosophyVisual}>
            <div className={styles.codeBlock}>
              <div className={styles.codeHeader}>
                <span>main.c</span>
              </div>
              <pre className={styles.codeContent}>
{`// Blink LED - Your first embedded lab
#include <avr/io.h>
#include <util/delay.h>

int main(void) {
    DDRB |= (1 << PB5);  // Set pin as output
    
    while (1) {
        PORTB ^= (1 << PB5);  // Toggle LED
        _delay_ms(500);
    }
    return 0;
}`}
              </pre>
            </div>
          </div>
        </div>
      </div>
    </section>
  );
}

// Call to Action Section
function CTASection() {
  return (
    <section className={styles.ctaSection}>
      <div className="container">
        <div className={styles.ctaContent}>
          <Heading as="h2" className={styles.ctaTitle}>
            Ready to Start Building?
          </Heading>
          <p className={styles.ctaText}>
            Join the community of learners exploring embedded systems, robotics, and IoT. 
            All content is open-source and free to use.
          </p>
          <div className={styles.ctaButtons}>
            <Link
              className={clsx('button button--lg', styles.primaryButton)}
              to="/docs/intro">
              Get Started
              <span className={styles.buttonArrow}>→</span>
            </Link>
            <Link
              className={clsx('button button--lg', styles.outlineButton)}
              to="/blog">
              Read the Blog
            </Link>
          </div>
        </div>
      </div>
    </section>
  );
}

export default function Home() {
  const { siteConfig } = useDocusaurusContext();
  return (
    <Layout
      title="Hands-on Learning in Embedded Systems, Robotics & IoT"
      description="Bits2Bytes Labs - Open-source educational initiative for hands-on learning in Embedded Systems, Robotics, and IoT">
      <HomepageHeader />
      <main>
        <HomepageFeatures />
        <LearningPathSection />
        <PhilosophySection />
        <CTASection />
      </main>
    </Layout>
  );
}
